import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  const GreenButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 1, 211, 152),
              borderRadius: BorderRadius.circular(8)),
          width: 155,
          height: 20,
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 10.60,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )),
    );
  }
}
