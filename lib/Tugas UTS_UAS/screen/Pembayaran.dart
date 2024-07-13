import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tugas_uts/Tugas%20UTS_UAS/model/modelKuota.dart';
import 'package:tugas_uts/Tugas%20UTS_UAS/screen/HomeAxis.dart';

class PembayaranPage extends StatelessWidget {
  final DaftarKuota kuota;

  const PembayaranPage({Key? key, required this.kuota}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Pilih Metode Pembayaran'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text('Dompet Digital'),
            onTap: () => showErrorDialog(context),
          ),
          ListTile(
            leading: Icon(Icons.credit_card),
            title: Text('Kartu Kredit/Debit'),
            onTap: () => showErrorDialog(context),
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Transfer Bank'),
            onTap: () => showErrorDialog(context),
          ),
          ListTile(
            leading: Icon(Icons.phone_android),
            title: Text('Pulsa'),
            onTap: () => showConfirmationDialog(context),
          ),
        ],
      ),
    );
  }

  void showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sistem Error'),
          content: Text('Sistem sedang error, ganti metode pembayaran.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Pembayaran'),
          content: Text(
              'Apakah Anda yakin ingin membeli ${kuota.namaKuota} seharga ${formatHarga(kuota.harga!)}?'),
          actions: [
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Ya, Bayar'),
              onPressed: () {
                Navigator.of(context).pop();
                processPayment(context);
              },
            ),
          ],
        );
      },
    );
  }

  void processPayment(BuildContext context) {
    final pulsaProvider = Provider.of<PulsaProvider>(context, listen: false);
    if (pulsaProvider.pulsaAwal < kuota.harga!) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Pembelian Gagal'),
            content: Text(
                'Ooops pulsa kamu kurang, mohon diisi terlebih dahulu\natau gunakan metode pembayaran lainnya'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      int newPulsa = pulsaProvider.pulsaAwal - kuota.harga!;
      pulsaProvider.updatePulsa(newPulsa);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Pembayaran Berhasil'),
            content: Text(
                'Anda telah membeli ${kuota.namaKuota} menggunakan pulsa\nSisa pulsa: ${formatHarga(newPulsa)}'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  String formatHarga(int harga) {
    final formatter = NumberFormat('#,###');
    return 'Rp ${formatter.format(harga)}';
  }
}
