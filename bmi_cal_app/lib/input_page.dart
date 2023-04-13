import 'package:bmi_cal_start/reuseable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';

const button_container_height = 80.0 ;
const active_color = Color(0XFFF7EDDB);
const button_color = Color(0XFF586c5c);
const inactive_color =  Color(0XFFa9af90);
enum Gender {male , female}



class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

    Gender? selected_gender ;
  // Color maleCardColor  = inactive_color;
  // Color femaleCardColor = inactive_color;
  //
  // void updateColor (int gender){
  //   if (gender == 1)//male
  //     {
  //       if(maleCardColor == inactive_color){
  //         maleCardColor = active_color;
  //         femaleCardColor = inactive_color;
  //       }
  //       else{
  //         maleCardColor = inactive_color;
  //       }
  //   }
  //
  //   if (gender == 2)//female
  //     {
  //     if(femaleCardColor == inactive_color){
  //       femaleCardColor = active_color;
  //       maleCardColor = inactive_color;
  //     }
  //     else{
  //       femaleCardColor = inactive_color;
  //     }
  //   }
  //
  //
  // }


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
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selected_gender = Gender.female;
                    });
                  },
                  child:  ReuseableCard(color: selected_gender == Gender.female ? active_color : inactive_color,
                  cardChild: const IconContent(
                    label: "Female",
                    icon: FontAwesomeIcons.venus,
                  ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selected_gender = Gender.male;
                    });
                  },
                  child: ReuseableCard(color:selected_gender == Gender.male ? active_color : inactive_color,
                    cardChild: const IconContent(
                      label: "Male",
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const Expanded(
          child: ReuseableCard(color:inactive_color),
        ),
        Expanded(
            child: Row(
          children: const [
            Expanded(
              child: ReuseableCard(color:inactive_color),
            ),
            Expanded(
              child: ReuseableCard(color:inactive_color),
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




