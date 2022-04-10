import 'package:flutter/material.dart';
import 'package:vertical_prototype/teste.dart';
import 'AllChatsDisplay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AllChatsDisplay()
      //home: Teste()
      );
  }
}
