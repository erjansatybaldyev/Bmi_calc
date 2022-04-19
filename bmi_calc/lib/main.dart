import 'package:bmi_calc/screens/input_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0x0ff0ae21),
        scaffoldBackgroundColor: const Color(0xff0a0e21),
      ),
      home: MyHomePage(),
    );
  }
}
