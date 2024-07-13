import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tugas_uts/Tugas%20UTS_UAS/default/defaultKuota.dart';
import 'package:tugas_uts/Tugas%20UTS_UAS/default/defaultLevelDeketan.dart';
import 'package:tugas_uts/Tugas%20UTS_UAS/logic/LoginAutentikasi.dart';
import 'package:tugas_uts/Tugas%20UTS_UAS/screen/ListKuota.dart';
import 'package:tugas_uts/Tugas%20UTS_UAS/screen/loginPage.dart';
import 'package:tugas_uts/Tugas%20UTS_UAS/widgets/fiturInHome.dart';
import 'package:tugas_uts/Tugas%20UTS_UAS/widgets/greenButton.dart';
import 'package:tugas_uts/Tugas%20UTS_UAS/model/modelKuota.dart';
import 'package:tugas_uts/Tugas UTS_UAS/screen/Detail_Kuota.dart';

class Homeaxis extends StatefulWidget {
  const Homeaxis({super.key});

  @override
  State<Homeaxis> createState() => _HomeaxisState();
}

//Provider Untuk Pulsa
class PulsaProvider extends ChangeNotifier {
  int _pulsaAwal = 100000;
  int get pulsaAwal => _pulsaAwal;

  void updatePulsa(int newPulsa) {
    _pulsaAwal = newPulsa < 0 ? 0 : newPulsa;
    notifyListeners();
  }
}

//Formatting harga
String formatHarga(int harga) {
  final formatter = NumberFormat('#,###');
  return 'Rp ${formatter.format(harga)}';
}

class _HomeaxisState extends State<Homeaxis> {
  final LoginAutentikasi _loginAutentikasi = LoginAutentikasi();
  int _selectedIndex = 0;
  late final int pulsaAwal;

  @override
  void initState() {
    super.initState();
    pulsaAwal = Provider.of<PulsaProvider>(context, listen: false).pulsaAwal;
    checkLoginStatus();
  }

  get index => null;

//Cek login status
  Future<void> checkLoginStatus() async {
    final isExpired = await _loginAutentikasi.isLoggedInExpired();
    if (isExpired) {
      await _loginAutentikasi.logout();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
        (route) => false,
      );
    } else {
      final nomorTelepon = await _loginAutentikasi.getUserInfo();
      if (nomorTelepon != null) {}
    }
  }

//Bottom Navbar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DaftarPaket()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Title
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          const Padding(padding: EdgeInsets.all(5)),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: const Text(
              'Hi, Prima',
              style: TextStyle(fontSize: 13, color: Colors.white),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 10,
            color: Colors.white,
          ),
          const Spacer(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(padding: EdgeInsets.only(right: 10)),
              Icon(
                Icons.favorite,
                size: 15,
                color: Colors.white,
              ),
              Icon(
                Icons.chat,
                size: 15,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
      //Body
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: const Text(
                    "083198679654",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Column(children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(
                              left: 5, top: 20.0, bottom: 6.0),
                          width: 185,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)),
                          //Pulsa
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'PULSA',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.purple),
                              ),
                              Row(
                                children: [
                                  Consumer<PulsaProvider>(
                                    builder: (context, pulsaProvider, child) {
                                      return Text(
                                          'Pulsa: ${formatHarga(pulsaProvider.pulsaAwal)}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.black));
                                    },
                                  ),
                                  const Icon(Icons.lock,
                                      color: Colors.red, size: 15),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      //Container kosong
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            margin:
                                const EdgeInsets.only(left: 5, bottom: 10.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0)),
                            width: 185,
                            height: 60,
                            child: Column(
                              children: [
                                const DefaultLevelDeketan(),
                                GreenButton(
                                  text: "CEK BONUS",
                                  onPressed: () {},
                                )
                              ],
                            )),
                      ),
                    ]),
                    const DefaultKuota()
                  ],
                ),

                //Icon-icon kecil
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FiturInHome(
                        icon: Icons.percent,
                        backgroundColor: Colors.blue,
                      ),
                      SizedBox(width: 10),
                      FiturInHome(
                        icon: Icons.circle,
                        backgroundColor: Colors.blue,
                      ),
                      SizedBox(width: 10),
                      FiturInHome(
                        icon: Icons.airplane_ticket,
                        backgroundColor: Color.fromARGB(255, 233, 25, 156),
                      ),
                      SizedBox(width: 10),
                      FiturInHome(
                        icon: Icons.front_hand,
                        backgroundColor: Colors.orange,
                      ),
                      SizedBox(width: 10),
                      FiturInHome(
                        icon: Icons.sim_card,
                        backgroundColor: Colors.blue,
                      ),
                      SizedBox(width: 10),
                      FiturInHome(
                        icon: Icons.airplane_ticket,
                        backgroundColor: Color.fromARGB(255, 233, 25, 156),
                      ),
                      SizedBox(width: 10),
                      FiturInHome(
                        icon: Icons.arrow_upward,
                        backgroundColor: Colors.green,
                      ),
                      SizedBox(width: 10),
                      FiturInHome(
                        icon: Icons.light,
                        backgroundColor: Color.fromARGB(255, 233, 25, 156),
                      ),
                      SizedBox(width: 10),
                      FiturInHome(
                        icon: Icons.camera_alt,
                        backgroundColor: Color.fromARGB(255, 233, 25, 156),
                      ),
                      SizedBox(width: 10),
                      FiturInHome(
                        icon: Icons.camera_alt,
                        backgroundColor: Color.fromARGB(255, 233, 25, 156),
                      ),
                    ],
                  ),
                ),

                //container pink
                Container(
                  margin: const EdgeInsets.all(10),
                  width: 380,
                  height: 250,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 233, 25, 156),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Hanya Untukmu",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14),
                        ),
                        const Text(
                          "Kita siapin kuota yang cocok buat\ntemenin kamu internetan",
                          style:
                              TextStyle(color: Colors.white, fontSize: 10.55),
                        ),
                        //3 button kecil
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            SizedBox(
                              width: 115,
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Rekomendasi',
                                      style: TextStyle(
                                          fontSize: 10.55,
                                          color: Colors.purple),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              constraints: const BoxConstraints(minWidth: 115),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Diskon',
                                      style: TextStyle(
                                          fontSize: 10.55,
                                          color: Colors.purple),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 115,
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Online',
                                      style: TextStyle(
                                          fontSize: 10.55,
                                          color: Colors.purple),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        //Tampilkan List kuota dari firestore
                        Center(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            width: 350,
                            height: 130,
                            child: StreamBuilder<List<DaftarKuota>>(
                              stream: bacaDaftarKuota(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final daftarKuota = snapshot.data!;
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: daftarKuota.length,
                                    itemBuilder: (context, index) {
                                      final kuota = daftarKuota[index];
                                      if (kuota.namaKuota != null) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailKuotaPage(
                                                        kuota: kuota),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            width: 150,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 1,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            margin: EdgeInsets.all(5),
                                            child: ListTile(
                                              title: Text(
                                                '${kuota.namaKuota!}\n${kuota.harga != null ? formatHarga(kuota.harga!) : 'Harga tidak tersedia'}',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return SizedBox.shrink();
                                      }
                                    },
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),

      //Bottom navbar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad),
            label: 'Playground',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            backgroundColor: Colors.pink,
            label: 'Paket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.headphones),
            label: 'Hiburan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle_outlined),
            label: 'Alifetime',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

//Baca data dari firestore
Stream<List<DaftarKuota>> bacaDaftarKuota() => FirebaseFirestore.instance
    .collection("list_kuota")
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((e) => DaftarKuota.fromJson(e.data())).toList());
