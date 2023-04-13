import 'package:flutter/material.dart';
import 'input_page.dart';


const labelTextStyle  = TextStyle(
  color: button_color,
  fontSize: 19,
  fontWeight: FontWeight.bold,
);




class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;
  const IconContent({required this.icon , required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Icon(icon,
          color: button_color,
          size: 90,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: labelTextStyle,
        )
      ],
    );
  }
}