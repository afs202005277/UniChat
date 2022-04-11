import 'package:flutter/material.dart';
import 'single_chat_display.dart';
import 'top_bar.dart';

class AllChatsDisplay extends StatelessWidget {
  const AllChatsDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopBar('UNICHAT'),
        body: SingleChatDisplay('DA', 'Desenho de Algoritmos', '2LEIC03', 11),
        );
  }
}
