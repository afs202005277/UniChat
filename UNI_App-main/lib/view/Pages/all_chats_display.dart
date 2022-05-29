import 'package:flutter/material.dart';
import 'single_chat_display.dart';
import 'get_chat_list.dart';

class AllChatsDisplay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AllChatsDisplayState();
  }
}

class AllChatsDisplayState extends State<AllChatsDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: chats(),
      ),
    );
  }

  Widget chats() {
    int GET_CURRENT_STUDENT_ID =
        1; // isto simula um acesso ao user q esta logado na UNI, para obter o numero mecanografico dele
    return Column(
        children: GetChatList.fetchAll(GET_CURRENT_STUDENT_ID)
            .map((chat) => SingleChatDisplay(chat.sigla, chat.nomeCompleto,
                chat.turma, chat.numParticipantes))
            .toList());
  }
}
