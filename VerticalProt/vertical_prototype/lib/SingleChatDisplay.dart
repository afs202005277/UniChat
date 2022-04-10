import 'package:flutter/material.dart';

class SingleChatDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
            height: 50,
            child: CircleAvatar(
              backgroundColor: Color.fromRGBO(149, 0, 20, 1.0),
              child: Center(
                child: Text(
                  "DA",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )),
        Container(
          height: 50,
          child: Align(
              alignment: Alignment.center,
              child: Text('Desenho de Algoritmos')),
        ),
        Container(
          height: 50,
          child: Align(alignment: Alignment.center, child: Text('2LEIC03')),
        ),
        Container(
          height: 25,
          width: 50,
          decoration: BoxDecoration(
              color: Color.fromRGBO(149, 0, 20, 1.0),
              borderRadius: BorderRadius.circular(5.0)),
          child: Align(alignment: Alignment.center, child: Text('11', style: TextStyle(color: Colors.white))),
        )
      ],
    );
  }
}
