import 'package:flutter/material.dart';

class SingleChatDisplay extends StatelessWidget {
  String _sigla, _nomeCompleto, _turma;
  int _numParticipantes;

  SingleChatDisplay(
      this._sigla, this._nomeCompleto, this._turma, this._numParticipantes,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 15.0),
        padding: const EdgeInsets.only(bottom: 15.0),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Color.fromRGBO(149, 0, 20, 1.0), width: 2.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                height: 50,
                child: CircleAvatar(
                  radius: 23,
                  backgroundColor: const Color.fromRGBO(149, 0, 20, 1.0),
                  child: Center(
                    child: Text(
                      _sigla,
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'GillSans',
                          fontSize: 20),
                    ),
                  ),
                )),
            SizedBox(
              height: 50,
              child: Align(
                  alignment: Alignment.center,
                  child: Text(_nomeCompleto,
                      style: const TextStyle(fontFamily: 'GillSans', fontSize: 20))),
            ),
            SizedBox(
              height: 50,
              child: Align(
                  alignment: Alignment.center,
                  child: Text(_turma,
                      style: const TextStyle(fontFamily: 'GillSans', fontSize: 20))),
            ),
            Container(
              height: 25,
              width: 50,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(149, 0, 20, 1.0),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(_numParticipantes.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'GillSans',
                          fontSize: 20))),
            )
          ],
        ));
  }
}
