import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TopBar extends StatelessWidget with PreferredSizeWidget {
  final String _title;
  final double barHeight = 85.0;
  double titleSize = 27.0;
  final Color mainColor = const Color.fromRGBO(149, 0, 20, 1);
  final double pictureSize = 60.0;
  final double bottomBorderThickness = 10.0;

  TopBar(this._title, {Key? key}) : super(key: key) {
    if (_title == "UNICHAT") {
      titleSize = 40.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: barHeight,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        AutoSizeText(_title,
            style: TextStyle(fontFamily: 'GillSans', fontSize: titleSize),
            maxLines: 1),
        Container(
          key: Key("profilePic"),
            margin: const EdgeInsets.only(left: 12),
            width: pictureSize,
            height: pictureSize,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/ruca.jpg'))))
      ]),
      backgroundColor: Colors.white,
      foregroundColor: mainColor,
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(bottomBorderThickness),
          child: Container(color: mainColor, height: bottomBorderThickness)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(barHeight);
}
