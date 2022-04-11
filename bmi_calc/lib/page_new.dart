import 'package:flutter/material.dart';
import 'package:bmi_calc/widgets/new_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 80.0;
const activeCardBoiok = Color(0xff1d1e33);
const inactiveCardBoiok = Color(0xFF111328);
const bottomContainerColor = Colors.red;
const bottomContainerWidht = double.infinity;

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
  Gender selectedGender; // funksya  chakyruuluchu

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
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                child: EseptooNew(
                  boiok: selectedGender == Gender.male
                      ? activeCardBoiok
                      : inactiveCardBoiok,
                  cardChild: IconWidget(
                    icon: FontAwesomeIcons.mars,
                    label: 'Male',
                  ),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: (() {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                }),
                child: EseptooNew(
                  boiok: selectedGender == Gender.female
                      ? activeCardBoiok
                      : inactiveCardBoiok, // ternarnyi operator
                  cardChild: IconWidget(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                ),
              )),
            ],
          )),
          Expanded(
              child: EseptooNew(
            boiok: activeCardBoiok,
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: EseptooNew(
                boiok: activeCardBoiok,
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
            height: bottomContainerHeight,
            child: Row(
              children: [
                Expanded(child: Icon(Icons.accessibility_new)),
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
