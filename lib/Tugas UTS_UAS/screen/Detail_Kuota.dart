import 'package:flutter/material.dart';
import 'package:tugas_uts/Tugas%20UTS_UAS/model/modelKuota.dart';
import 'package:tugas_uts/Tugas%20UTS_UAS/screen/Pembayaran.dart';

class DetailKuotaPage extends StatelessWidget {
  final DaftarKuota kuota;

  const DetailKuotaPage({Key? key, required this.kuota}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Kuota'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Paket: ${kuota.namaKuota}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(2),
              width: 220,
              height: 100,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                  ),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Harga: ${formatHarga(kuota.harga!)}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple)),
                  Text('Masa Aktif: ${kuota.masaAktif}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple)),
                  Text('Jumlah Data: ${kuota.totalKuota}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple)),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Beli Paket'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PembayaranPage(kuota: kuota)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  String formatHarga(int harga) {
    // Implementasi formatHarga sesuai kebutuhan
    return 'Rp ${harga.toString()}';
  }
}
