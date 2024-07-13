import 'package:flutter/material.dart';
import 'package:tugas_uts/Tugas%20UTS_UAS/logic/LoginAutentikasi.dart';
import 'package:tugas_uts/Tugas%20UTS_UAS/screen/HomeAxis.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nomorTeleponController = TextEditingController();
  final LoginAutentikasi _loginAutentikasi = LoginAutentikasi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(right: 2),
                width: 90,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(26)),
                child: const Center(
                  child: Row(
                    children: [
                      Icon(
                        Icons.question_mark,
                        color: Colors.red,
                        size: 20,
                      ),
                      Text(
                        "BANTUAN",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      Text(
                        "Masukkan nomor HP AXIS\nuntuk masuk ke akun kamu",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 380,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 110,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextField(
                                controller:
                                    _nomorTeleponController, // Tambahkan controller di sini
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: const InputDecoration(
                                  hintText: "083XXXXXXXXX",
                                  border: InputBorder.none,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "LIHAT NOMOR HP SAYA",
                                    style: TextStyle(
                                      color: Colors.pink,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_right_alt,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 5),
                          height: 80,
                          decoration: const BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 100,
                                height: 50,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Belum punya nomor AXIS?\nDapatkan kartu perdanamu di sini!",
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.purple),
                                  ),
                                  SizedBox(
                                    width: 150,
                                    height: 40,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "BELI SEKARANG",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Dengan menekan tombol lanjut, saya setuju dengan\nSyarat&Ketentuan AXIS",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Center(
                  child: GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        width: 370,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 72, 255, 148)),
                        child: const Center(
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onTap: () async {
                        String nomorTelepon = _nomorTeleponController.text;
                        bool isLoggedIn =
                            await _loginAutentikasi.login(nomorTelepon);
                        if (isLoggedIn) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Homeaxis()),
                              (route) => false);
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Login Gagal"),
                              content: const Text("Nomor HP salah"),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("OK"),
                                ),
                              ],
                            ),
                          );
                        }
                      }),
                ),
                const Center(
                  child: Text(
                    "Belum registrasi kartu? Klik tombol dibawah ini.",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                Center(
                  child: GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        width: 370,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: const Center(
                          child: Text(
                            "REGISTRASI KARTU PERDANA",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.purple,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onTap: () {}),
                )
              ],
            ),
          ),
        ));
  }
}
