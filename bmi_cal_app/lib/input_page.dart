import 'package:bmi_cal_start/reuseable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';

const button_container_height = 80.0 ;
const active_color = Color(0XFFa9af90);
const button_color = Color(0XFF586c5c);




class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF202e32),
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
        //گذاشتن این expanded ها باعث responsive شدن UI می شود
        Expanded(
          child: Row(
            children:  const [
              Expanded(
                child: ReuseableCard(color:active_color,
                cardChild: IconContent(
                  label: "Female",
                  icon: FontAwesomeIcons.venus,
                ),
                ),
              ),
              Expanded(
                child: ReuseableCard(color:active_color,
                  cardChild: IconContent(
                    label: "Male",
                    icon: FontAwesomeIcons.mars,
                  ),
                ),
              )
            ],
          ),
        ),
        const Expanded(
          child: ReuseableCard(color:active_color),
        ),
        Expanded(
            child: Row(
          children: const [
            Expanded(
              child: ReuseableCard(color:active_color),
            ),
            Expanded(
              child: ReuseableCard(color:active_color),
            ),
          ],
        )),
            Container(
              color: button_color,
              width: double.infinity,
              height: button_container_height,
            )
      ]),
    );
  }
}




