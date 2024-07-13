import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class BuatListKuotaScreen extends StatefulWidget {
  BuatListKuotaScreen(
      {super.key,
      required this.harga,
      required this.jenisKuota,
      required this.masaAktif,
      required this.namaKuota,
      required this.tipeKuota,
      required this.totalKuota});

  int harga;
  String masaAktif;
  String namaKuota;
  String tipeKuota;
  String totalKuota;
  String jenisKuota;

  @override
  State<BuatListKuotaScreen> createState() => _BuatListKuotaScreenState();
}

class _BuatListKuotaScreenState extends State<BuatListKuotaScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _masaAktifController = TextEditingController();
  final TextEditingController _namaKuotaController = TextEditingController();
  final TextEditingController _tipeKuotaController = TextEditingController();
  final TextEditingController _totalKuotaController = TextEditingController();
  final TextEditingController _jenisKuotaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _hargaController.text = widget.harga.toString();
    _masaAktifController.text = widget.masaAktif;
    _namaKuotaController.text = widget.namaKuota;
    _tipeKuotaController.text = widget.tipeKuota;
    _totalKuotaController.text = widget.totalKuota;
    _jenisKuotaController.text = widget.totalKuota;
  }

  void dispose() {
    // Jangan lupa untuk dispose controllers
    _hargaController.dispose();
    _masaAktifController.dispose();
    _namaKuotaController.dispose();
    _tipeKuotaController.dispose();
    _totalKuotaController.dispose();
    _jenisKuotaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Buat List Kuota'),
      ),
      body: Center(
        child: Column(
          children: [
            Column(
              children: [
                TextField(
                  controller: _hargaController,
                  decoration: const InputDecoration(
                    labelText: 'Harga',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                TextField(
                  controller: _masaAktifController,
                  decoration: const InputDecoration(
                    labelText: 'Masa Aktif',
                  ),
                ),
                TextField(
                  controller: _namaKuotaController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Kuota',
                  ),
                ),
                TextField(
                  controller: _tipeKuotaController,
                  decoration: const InputDecoration(
                    labelText: 'Tipe Kuota',
                  ),
                ),
                TextField(
                  controller: _totalKuotaController,
                  decoration: const InputDecoration(
                    labelText: 'Total Kuota',
                  ),
                ),
                TextField(
                  controller: _jenisKuotaController,
                  decoration: const InputDecoration(
                    labelText: 'Jenis Kuota',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _tambahKuotaBaru();
                    Icon(Icons.add);
                  },
                  child: const Text('Tambah Kuota'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _tambahKuotaBaru() async {
    int hargaKuota = int.tryParse(_hargaController.text) ?? 0;

    final kuota = <String, dynamic>{
      "Harga": hargaKuota,
      "Masa Aktif": _masaAktifController.text,
      "Nama Kuota": _namaKuotaController.text,
      "Tipe Kuota": _tipeKuotaController.text,
      "Total Kuota": _totalKuotaController.text,
    };

    try {
      await _firestore
          .collection("list_kuota")
          .doc(_jenisKuotaController.text)
          .set(kuota);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kuota berhasil ditambahkan')),
      );
    } catch (e) {
      print("Error writing document: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal menambahkan kuota')),
      );
    }
  }
}
