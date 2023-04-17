import 'package:bmi_cal_start/screens/result_page.dart';
import 'package:bmi_cal_start/components/reuseable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import '../components/round_icon_button.dart';
import '../components/calc_button.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF202e32),
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        //گذاشتن این expanded ها باعث responsive شدن UI می شود
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReuseableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  color: selectedGender == Gender.female
                      ? KActive_color
                      : KInactive_color,
                  cardChild: const IconContent(
                    label: "Female",
                    icon: FontAwesomeIcons.venus,
                  ),
                ),
              ),
              Expanded(
                child: ReuseableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  color: selectedGender == Gender.male
                      ? KActive_color
                      : KInactive_color,
                  cardChild: const IconContent(
                    label: "Male",
                    icon: FontAwesomeIcons.mars,
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: ReuseableCard(
            color: KInactive_color,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Height",
                  style: KLabel_TextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline
                      .alphabetic, //when using baseline ... base should be mentioned
                  children: [
                    Text(height.toString(), style: KNumberl_TextStyle),
                    const Text("cm", style: KLabel_TextStyle),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30)),
                  child: Slider(
                      min: 120.0,
                      max: 220.0,
                      activeColor: KButton_color,
                      inactiveColor: KActive_color,
                      value: height.toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      }),
                )
              ],
            ),
          ),
        ),
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: ReuseableCard(
                color: KInactive_color,
                cardChild: Column(
                  children: [
                    const Text("Weight", style: KLabel_TextStyle),
                    Text(weight.toString(), style: KNumberl_TextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          iconColor: KButton_color,
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          iconColor: KButton_color,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ReuseableCard(
                color: KInactive_color,
                cardChild: Column(
                  children: [
                    const Text("Age", style: KLabel_TextStyle),
                    Text(age.toString(), style: KNumberl_TextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          iconColor: KButton_color,
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          iconColor: KButton_color,
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        )),

        CalcButton(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ResultPage(),
              ),
            );
          },
          titleButton: 'Calculate',
        ),
      ]),
    );
  }
}




