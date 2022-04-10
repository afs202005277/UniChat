import 'package:flutter/material.dart';
import 'image_loader.dart';

class TopBar extends StatelessWidget with PreferredSizeWidget {
  final String _title;

  TopBar(this._title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(_title),
            CircleAvatar(
              radius: 25.0,
              child: ClipOval(
                child: Image.asset('assets/images/ruca.jpg'),
                //borderRadius: BorderRadius.circular(10.0),
              ),
            )
          ]),
      backgroundColor: Colors.white,
      foregroundColor: Color.fromRGBO(149, 0, 20, 1),
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(10.0),
          child: Container(color: Color.fromRGBO(149, 0, 20, 1), height: 10.0)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(95.0);
}
