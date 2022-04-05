import 'package:flutter/material.dart';

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
                boiok: Colors.blue,
              )),
              Expanded(
                  child: EseptooNew(
                boiok: Color.fromARGB(255, 197, 10, 141),
              )),
            ],
          )),
          Expanded(
              child: EseptooNew(
            boiok: Colors.lightGreen,
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: EseptooNew(
                boiok: Colors.red,
              )),
              Expanded(
                  child: EseptooNew(
                boiok: Colors.blueGrey,
              )),
            ],
          )),
        ],
      ),
    );
  }
}

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
