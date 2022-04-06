import 'package:flutter/material.dart';
import 'package:bmi_calc/widgets/new_page.dart';

const bottomContainerHeight = 80.0;
const activeCardBoiok = Color(0xff1d1e33);
const bottomContainerColor = Colors.red;
const bottomContainerWidht = double.infinity;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, String title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                  child: EseptooNew(
                boiok: activeCardBoiok,
              )),
              Expanded(
                  child: EseptooNew(
                boiok: activeCardBoiok,
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
            margin: EdgeInsets.only(top: 10.0),
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
