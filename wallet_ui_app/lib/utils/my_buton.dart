import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final String buttonCaption;
  final String imagePath;
  MyButton({required this.buttonCaption , required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          height: 90,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 40,
                  spreadRadius: 2
              ),
            ],
          ),
          child: Image.asset(imagePath),
        ),
        SizedBox(
          height: 5,
        ),
        Text(buttonCaption)
      ],
    );
  }
}
