import 'package:flutter/material.dart';
import 'SingleChatDisplay.dart';

class ChatDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('UniChat')),
        body: MediaQuery.removePadding(
          context: context,
          removeLeft: true,
          removeBottom: true,
          removeRight: true,
          removeTop: true,
          child: SingleChatDisplay(),
        ));
  }
}
