import 'package:bmi_calc/screens/result_page.dart';
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
          title: const Center(
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
                const Text(
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
                    const Text(
                      'cm',
                      style: labelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color(0xFF8d8e98),
                      activeTrackColor: Colors.white,
                      thumbColor: const Color(0xffeb1555),
                      overlayColor: const Color(0xffeb1555),
                      thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 15.0), // syzylgan kyzyl choiondu
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0)),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    // activeColor: Color(0xffeb1555),
                    inactiveColor: const Color(0xFF8d8e98),
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
                      const Text(
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
                          const SizedBox(width: 10.0),
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
                  const Text(
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
                      const SizedBox(
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Results_Page(
                      bmiResult: calculateBrain.calculateBMI(
                          height: height, weight: weight),
                    ),
                  ));
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
