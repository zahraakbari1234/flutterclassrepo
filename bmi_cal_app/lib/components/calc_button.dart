import 'package:flutter/material.dart';
import '../constants.dart';

class CalcButton extends StatelessWidget {
  final VoidCallback onTap;
  final String titleButton;
  const CalcButton({required this.onTap, required this.titleButton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            titleButton,
            style: const TextStyle(
                color: Color(0xfff7eddb),
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        color: KButton_color,
        width: double.infinity,
        height: KButton_container_height,
      ),
    );
  }
}
