import 'package:flutter/material.dart';

class SingleChatDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double currrentWidth = MediaQuery.of(context).size.width;
    return Container(
        height: 100.0,
        width: currrentWidth,
        padding: EdgeInsets.zero,
        color: Colors.red,
        child: Row(
          children: const [
            Align(alignment: Alignment.centerLeft, child: Text('DA')),
            Align(
                alignment: Alignment.center,
                child: Text('Desenho de Algoritmos')),
            Align(alignment: Alignment.center, child: Text('2LEIC03')),
            Align(alignment: Alignment.bottomRight, child: Text('11')),
            Align(
              alignment: Alignment(1, 1),
              child: Text("teste"),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ));
  }
}
