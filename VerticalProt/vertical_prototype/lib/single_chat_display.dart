import 'package:flutter/material.dart';
import 'writing.dart';

class SingleChatDisplay extends StatelessWidget {
  final String _sigla, _nomeCompleto, _turma;
  final int _numParticipantes;
  final double marginsThickness = 15.0;
  final Color mainColor = const Color.fromRGBO(149, 0, 20, 1.0);
  final double separatorThickness = 2.0;
  final double rowHeight = 50.0;
  final double fontSize = 23.0;
  final double circleRadius = 23.0;

  const SingleChatDisplay(
      this._sigla, this._nomeCompleto, this._turma, this._numParticipantes,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Writing(_nomeCompleto)),
          );
        },
        style: ElevatedButton.styleFrom(primary: Colors.white),
        child: Container(
            margin: EdgeInsets.only(top: marginsThickness),
            padding: EdgeInsets.only(bottom: marginsThickness),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: mainColor, width: separatorThickness))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    height: rowHeight,
                    child: CircleAvatar(
                      radius: circleRadius,
                      backgroundColor: mainColor,
                      child: Center(
                        child: Text(
                          _sigla,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'GillSans',
                              fontSize: fontSize),
                        ),
                      ),
                    )),
                SizedBox(
                  height: rowHeight,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(_nomeCompleto,
                          style: TextStyle(
                              color: mainColor,
                              fontFamily: 'GillSans',
                              fontSize: fontSize))),
                ),
                SizedBox(
                  height: rowHeight,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(_turma,
                          style: TextStyle(
                              color: mainColor,
                              fontFamily: 'GillSans',
                              fontSize: fontSize))),
                ),
                Container(
                  height: rowHeight / 2,
                  width: rowHeight,
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(_numParticipantes.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'GillSans',
                              fontSize: fontSize))),
                )
              ],
            )));
  }
}
