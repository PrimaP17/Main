import 'package:flutter/material.dart';

class DefaultLevelDeketan extends StatelessWidget {
  const DefaultLevelDeketan({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.circle_outlined,
          color: Colors.purple,
          size: 18,
        ),
        Text(
          "Level Deketan",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
      ],
    );
  }
}
