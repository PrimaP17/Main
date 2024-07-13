import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tugas_uts/Tugas%20UTS_UAS/model/modelKuota.dart';
import 'package:tugas_uts/Tugas%20UTS_UAS/screen/Detail_Kuota.dart';

class DaftarPaket extends StatefulWidget {
  const DaftarPaket({super.key});

  @override
  State<DaftarPaket> createState() => _DaftarPaketState();
}

String formatHarga(int harga) {
  final formatter = NumberFormat('#,###');
  return 'Rp ${formatter.format(harga)}';
}

class _DaftarPaketState extends State<DaftarPaket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Kuota Internet Buat Kamu',
          style: TextStyle(
            color: Colors.purple,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: StreamBuilder<List<DaftarKuota>>(
          stream: readDaftarKuota(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Error");
            } else if (snapshot.hasData) {
              final kuota = snapshot.data!;
              return ListView.builder(
                itemCount: kuota.length,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: ListTile(
                    title: Text(kuota[index].namaKuota!),
                    subtitle: Text(formatHarga(kuota[index].harga!)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailKuotaPage(kuota: kuota[index]),
                        ),
                      );
                    },
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

Stream<List<DaftarKuota>> readDaftarKuota() => FirebaseFirestore.instance
    .collection("list_kuota")
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((e) => DaftarKuota.fromJson(e.data())).toList());
