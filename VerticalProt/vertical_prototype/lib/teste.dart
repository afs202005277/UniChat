import 'package:flutter/material.dart';

class Teste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(title: const Text('UniChat')),
        body: Row(
          children: [
            Container(
              height: 70.0,
              width: MediaQuery.of(context).size.width,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.orange)),
              child: Align(alignment: Alignment.center, child: Text("teste")),
            )
          ],
        ));
  }
}
