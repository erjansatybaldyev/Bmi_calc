import 'package:flutter/material.dart';
import 'package:bmi_calc/widgets/new_page.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

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
  int height = 180; // funksya  chakyruuluchu

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
                  'Height',
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
                Slider(
                  value: height.toDouble(),
                  min: 120.0,
                  max: 220.0,
                  activeColor: Color(0xffeb1555),
                  inactiveColor: Color(0xFF8d8e98),
                  onChanged: (double value) {
                    setState(() {
                      height = value.round();
                    });
                  },
                ), // jyldyrgych slider menen ishtoo
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: EseptooNew(
                boiok: activeCardBoiok,
                cardChild: Column(children: [
                  Text(
                    '89',
                    style: kNumberTextStyle,
                  )
                ]),
              )),
              Expanded(
                  child: EseptooNew(
                boiok: activeCardBoiok,
              )),
            ],
          )),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 11.0),
            width: bottomContainerWidht,
            height: kBottomContainerHeight,
            child: Row(
              children: [
                Expanded(
                  child: Icon(Icons.accessibility_new),
                ),
                Expanded(child: Icon(Icons.add_alarm)),
                Expanded(
                    child: Text('Bishkek',
                        style: TextStyle(color: activeCardBoiok)))
              ],
            ),
          )
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
