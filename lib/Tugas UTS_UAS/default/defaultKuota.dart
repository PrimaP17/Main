import 'package:flutter/material.dart';
import 'package:tugas_uts/Tugas%20UTS_UAS/widgets/greenButton.dart';

class DefaultKuota extends StatelessWidget {
  const DefaultKuota({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: 185,
        height: 166,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.only(
          left: 15,
          top: 20.0,
          bottom: 6.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.shop,
              size: 50,
              color: Color.fromARGB(255, 171, 120, 180),
            ),
            const Text(
              "Belum ada paket",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 11),
            ),
            const Text(
              "Aktifkan yuk! buat temenin kamu internetan terus",
              style: TextStyle(fontSize: 10.55, color: Colors.grey),
            ),
            GreenButton(
              text: "AKTIFKAN",
              onPressed: () {},
            ),
            const Spacer(),
            const Row(
              children: [
                Text(
                  "Detail Paket",
                  style: TextStyle(
                      fontSize: 10.55,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_forward_ios, size: 10)
              ],
            )
          ],
        ),
      ),
    );
  }
}
