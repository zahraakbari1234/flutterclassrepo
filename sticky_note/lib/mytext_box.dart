import 'package:flutter/material.dart';



class MyTextBox extends StatelessWidget {

  final String text;
  MyTextBox({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          padding: EdgeInsets.all(15),
            color: Colors.yellow[200],
            child:Text(text,style: TextStyle(
                color: Colors.black
            ),)
        ),
      ),
    );
  }
}

