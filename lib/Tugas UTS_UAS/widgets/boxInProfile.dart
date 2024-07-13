import 'package:flutter/material.dart';

class BoxInProfile extends StatelessWidget {
  const BoxInProfile({super.key, required this.text, required this.textinbox});

  final String text;
  final String textinbox;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(5),
              width: 350,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: Text(
                textinbox,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
