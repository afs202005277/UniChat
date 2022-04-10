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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
            height: 50,
            child: CircleAvatar(
              backgroundColor: Color.fromRGBO(149, 0, 20, 1.0),
              child: Center(
                child: Text(
                  _sigla,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )),
        Container(
          height: 50,
          child: Align(alignment: Alignment.center, child: Text(_nomeCompleto)),
        ),
        Container(
          height: 50,
          child: Align(alignment: Alignment.center, child: Text(_turma)),
        ),
        Container(
          height: 25,
          width: 50,
          decoration: BoxDecoration(
              color: Color.fromRGBO(149, 0, 20, 1.0),
              borderRadius: BorderRadius.circular(5.0)),
          child: Align(
              alignment: Alignment.center,
              child: Text(_numParticipantes.toString(),
                  style: TextStyle(color: Colors.white))),
        )
      ],
    );
  }
}
