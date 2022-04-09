import 'package:flutter/material.dart';

class SingleChatDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UniChat')),
      body: Row(
        children: const [
          Text('DA'),
          Text('Desenho de Algoritmos'),
          Text('2LEIC03'),
          Text('11'),
        ],
      ),
    );
  }
}
