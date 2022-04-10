import 'package:flutter/material.dart';
import 'SingleChatDisplay.dart';

class AllChatsDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('UniChat')),
        body: SingleChatDisplay(),
        );
  }
}
