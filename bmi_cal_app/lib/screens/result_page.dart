import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reuseable_card.dart';
import '../components/calc_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF202e32),
        title: Center(
          child: Text(
            'BMI CALC',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomCenter,
            child: Text(
              "Your Result",
              style: KTitle_TextStyle,
            ),
          )),
          Expanded(
            flex: 4,
              child: ReuseableCard(
            color: KActive_color,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Normal",
                  style: KResult_TextStyle,
                ),
                Text(
                  "18",
                  style: KNumberl_TextStyle,
                ),
                Text(
                  "خیلی لاغری خوش بحالت",
                  style: KBody_TextStyle,
                )
              ],
            ),
          )),
          CalcButton(onTap: () { Navigator.pop(context); },
            titleButton: 'ReCalculate',
          ),
        ],
      ),
    );
  }
}
