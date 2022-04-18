import 'package:bmi_calc/constants.dart';
import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8d8e98),
);

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
          style: labelTextStyle, // const ko jazyldy
        )
      ],
    );
  }
}
