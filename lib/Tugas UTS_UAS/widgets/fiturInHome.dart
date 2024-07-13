import 'package:flutter/material.dart';

class FiturInHome extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;

  const FiturInHome(
      {super.key, required this.icon, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: const BoxConstraints(
        maxHeight: 45,
      ).constrainHeight(),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(
        icon,
        size: 25,
        color: Colors.white,
      ),
    );
  }
}
