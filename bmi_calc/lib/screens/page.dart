import 'package:bmi_calc/components/buttom.dart';
import 'package:bmi_calc/constants.dart';
import 'package:bmi_calc/screens/calculate_brain.dart';
import 'package:bmi_calc/widgets/new_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import '../constants.dart';

class Results_Page extends StatelessWidget {
  Results_Page(
      {@required this.bmiResult, this.resultText, this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'YOUR RESULTS',
                  style: kTitileTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: EseptooNew(
                boiok: activeCardBoiok,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: resultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    )
                  ],
                ),
              ),
            ),
            BottomButton(
                onTap: () {
                  Navigator.pop(context); //artka kaittuuu
                },
                buttonTitle: 'RE-CALCULATE')
          ],
        ));
  }
}
