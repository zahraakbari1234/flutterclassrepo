import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reuseable_card.dart';
import '../components/calc_button.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String detailResult;

  const ResultPage({required this.bmiResult , required this.resultText , required this.detailResult}) ;

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
                  resultText.toUpperCase(),
                  style: KResult_TextStyle,
                ),
                Text(
                  bmiResult,
                  style: KNumberl_TextStyle.copyWith(color: Color(0XFF202e32)),
                ),
                Text(
                  detailResult,
                  style: KBody_TextStyle,
                )
              ],
            ),
          )),
          CalcButton(onTap: () {
            // Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  InputPage(
                ),
              ),
            );
            },

            titleButton: 'ReCalculate',
          ),
        ],
      ),
    );
  }
}
