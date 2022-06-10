import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni/view/Pages/all_chats_display.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'all_chats_display.dart';

class UniChatPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UniChatPageViewState();
}

/// Manages the 'Bugs and sugestions' section of the app.
class UniChatPageViewState extends SecondaryPageViewState {
  @override
  Widget getBody(BuildContext context) {
    return Container(
        //margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: AllChatsDisplay());
  }
}
