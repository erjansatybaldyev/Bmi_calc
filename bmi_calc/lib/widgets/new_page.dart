import 'package:flutter/material.dart';
import 'package:bmi_calc/page_new.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EseptooNew extends StatelessWidget {
  EseptooNew({@required this.boiok, this.cardChild});
  final Color boiok;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: boiok,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
