import 'package:cloud_firestore/cloud_firestore.dart';

class DaftarKuota {
  int? harga;
  String? masaAktif;
  String? namaKuota;
  String? tipeKuota;
  String? totalKuota;

  DaftarKuota({
    this.harga,
    this.masaAktif,
    this.namaKuota,
    this.tipeKuota,
    this.totalKuota,
  });

  DaftarKuota.fromJson(Map<String, dynamic> json) {
    harga = json['Harga'];
    masaAktif = json['Masa Aktif'];
    namaKuota = json['Nama Kuota'];
    tipeKuota = json['Tipe Kuota'];
    totalKuota = json['Total Kuota'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Harga'] = this.harga;
    data['Masa Aktif'] = this.masaAktif;
    data['Nama Kuota'] = this.namaKuota;
    data['Tipe Kuota'] = this.tipeKuota;
    data['Total Kuota'] = this.totalKuota;

    return data;
  }

  static fromFirestore(QueryDocumentSnapshot<Map<String, dynamic>> doc) {}
}
