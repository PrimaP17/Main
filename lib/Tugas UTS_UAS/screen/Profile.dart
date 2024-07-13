import 'package:flutter/material.dart';
import 'package:tugas_uts/Tugas%20UTS_UAS/widgets/boxInProfile.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "PROFIL SAYA",
          style: TextStyle(
              color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
      body: Column(
        children: [
          //column pertama
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 147, 238),
                  borderRadius: BorderRadius.circular(95)),
              width: 85,
              height: 85,
              child: const Icon(
                Icons.person,
                size: 80,
              ),
            ),
          ),
          const BoxInProfile(text: "NAMA PANGGILAN", textinbox: "Prima"),
          const BoxInProfile(
              text: "EMAIL", textinbox: "djmarshmello123mm@gmail.com"),
          const BoxInProfile(text: "NOMOR HP", textinbox: "083198679654"),
          const BoxInProfile(text: "KTP", textinbox: "............"),
          const BoxInProfile(
              text: "NOMOR KARTU KELUARGA", textinbox: "............"),
          GestureDetector(
            onTap: () {},
            child: Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 1, 211, 152),
                    borderRadius: BorderRadius.circular(8)),
                width: 350,
                height: 40,
                child: const Center(
                  child: Text(
                    "SIMPAN",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
