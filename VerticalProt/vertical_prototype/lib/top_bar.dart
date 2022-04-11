import 'package:flutter/material.dart';

class TopBar extends StatelessWidget with PreferredSizeWidget {
  final String _title;

  TopBar(this._title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 85,
      title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        const Text("      "),
        Text(_title, style: const TextStyle(fontFamily: 'GillSans', fontSize: 40)),
        Container(
            width: 60.0,
            height: 60.0,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/ruca.jpg'))))
      ]),
      backgroundColor: Colors.white,
      foregroundColor: const Color.fromRGBO(149, 0, 20, 1),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10.0),
          child: Container(color: const Color.fromRGBO(149, 0, 20, 1), height: 10.0)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(85.0);
}
