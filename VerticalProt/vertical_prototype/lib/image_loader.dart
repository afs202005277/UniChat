import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  final String _assetPath;

  ImageLoader(this._assetPath);

  @override
  Widget build(BuildContext context) {
    return Image.asset(_assetPath);
  }
}
