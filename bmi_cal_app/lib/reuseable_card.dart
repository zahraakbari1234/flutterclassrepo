import 'package:flutter/material.dart';


class ReuseableCard extends StatelessWidget {
  final Color color;
  final Widget? cardChild;
  const ReuseableCard({required this.color,  this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0XFFa9af90),
      ),
      child: cardChild,
    );
  }
}