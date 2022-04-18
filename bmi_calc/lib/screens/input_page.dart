import 'package:bmi_calc/screens/page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calc/widgets/new_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'calculate_brain.dart';

import '../constants.dart';
import '../components/buttom.dart';
import '../components/round_icon_button.dart';

enum Gender {
  male,
  female,
} // funksia jazdyk

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, String title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 28;
  // funksya  chakyruuluchu

  // Color maleCardBoiok = inactiveCardBoiok;
  // Color femaleCardBoiok = inactiveCardBoiok;

  // void updateBoiok(Gender selectedgender) {
  //   if (selectedgender == Gender.male) {
  //     if (maleCardBoiok == inactiveCardBoiok) {
  //       maleCardBoiok = activeCardBoiok;
  //       femaleCardBoiok = inactiveCardBoiok;
  //     } else {
  //       maleCardBoiok = inactiveCardBoiok;
  //     } //basyildy ozgorod

  //   } else {
  //     // female card pressed
  //     if (selectedgender == Gender.female) {
  //       if (femaleCardBoiok == inactiveCardBoiok) {
  //         femaleCardBoiok = activeCardBoiok;
  //         maleCardBoiok = inactiveCardBoiok; // baskanda ekoosuno perehot
  //       } else {
  //         femaleCardBoiok = inactiveCardBoiok;
  //       }
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text('KG Eseptoo'),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // center kyluu
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: EseptooNew(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                boiok: selectedGender == Gender.male
                    ? activeCardBoiok
                    : inactiveCardBoiok,
                cardChild: IconWidget(
                  icon: FontAwesomeIcons.mars,
                  label: 'Бала',
                ),
              )),
              Expanded(
                  child: EseptooNew(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                boiok: selectedGender == Gender.female
                    ? activeCardBoiok
                    : inactiveCardBoiok, // ternarnyi operator
                cardChild: IconWidget(
                  icon: FontAwesomeIcons.venus,
                  label: 'Кыз',
                ),
              )),
            ],
          )),
          Expanded(
              child: EseptooNew(
            boiok: activeCardBoiok,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Боюнуз',
                  style: labelTextStyle, // constantstan keldy
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberTextStyle, // kyskartuu
                    ),
                    Text(
                      'cm',
                      style: labelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8d8e98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xffeb1555),
                      overlayColor: Color(0xffeb1555),
                      thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0), // syzylgan kyzyl choiondu
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0)),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    // activeColor: Color(0xffeb1555),
                    inactiveColor: Color(0xFF8d8e98),
                    onChanged: (double value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                  ),
                ), // jyldyrgych slider menen ishtoo
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  // weigt jazyldy
                  child: EseptooNew(
                boiok: activeCardBoiok,
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Салмак",
                        style: kNumberTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RundIconButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            icon: FontAwesomeIcons.minus,
                          ),
                          SizedBox(width: 10.0),
                          RundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus)
                        ],
                      )
                    ]),
              )),
              Expanded(
                  child: EseptooNew(
                boiok: activeCardBoiok,
                cardChild: Column(children: [
                  Text(
                    'жаш',
                    style: kNumberTextStyle,
                  ),
                  Text(
                    age.toString(),
                    style: kNumberTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RundIconButton(
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                          icon: FontAwesomeIcons.minus),
                      SizedBox(
                        width: 10.0,
                      ),
                      RundIconButton(
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                          icon: FontAwesomeIcons.plus)
                    ],
                  )
                ]),
              )),
            ],
          )),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculateBrain calc =
                  CalculateBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Results_Page(
                      resultText: calc.calculateBMI(),
                      bmiResult: calc.getResult(),
                      interpretation: calc.getInterpretation()),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  IconWidget({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 80.0),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8d8e98),
          ),
        )
      ],
    );
  }
}
