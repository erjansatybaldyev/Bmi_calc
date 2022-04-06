import 'package:flutter/material.dart';
import 'package:bmi_calc/page_new.dart';

class EseptooNew extends StatelessWidget {
  EseptooNew({this.boiok});
  Color boiok;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: boiok,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
