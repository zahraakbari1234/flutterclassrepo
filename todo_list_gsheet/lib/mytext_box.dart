import 'package:flutter/material.dart';



class MyTextBox extends StatelessWidget {

  final String text;
  const MyTextBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          padding: const EdgeInsets.all(15),
            color: Colors.grey[400],
            child:Text(text,style: const TextStyle(
                color: Colors.black
            ),)
        ),
      ),
    );
  }
}

