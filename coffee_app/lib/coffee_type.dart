import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {

  final String coffee_type ;
  final bool isSelected;
  final void Function() onTap ;
  CoffeeType({required this.coffee_type , required this.isSelected , required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          coffee_type,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.orange : Colors.white
          ),

        ),
      ),
    );
  }
}
