import 'package:flutter/material.dart';
import 'single_chat_display.dart';
import 'top_bar.dart';
import 'get_chat_list.dart';

class AllChatsDisplay extends StatelessWidget {
  const AllChatsDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: TopBar('UNICHAT'), body: chats());
  }

  Widget chats() {
    int GET_CURRENT_STUDENT_ID = 1;
    return Column(
        children: GetChatList.fetchAll(GET_CURRENT_STUDENT_ID)
            .map((chat) => SingleChatDisplay(chat.sigla, chat.nomeCompleto,
                chat.turma, chat.numParticipantes))
            .toList());
  }
}
