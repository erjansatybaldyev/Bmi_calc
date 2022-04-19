import 'package:flutter/material.dart';

class EseptooNew extends StatelessWidget {
  EseptooNew({@required this.boiok, this.cardChild, this.onPress});
  final Color boiok;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress, // eseptoo new kirip ketti
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: boiok,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
