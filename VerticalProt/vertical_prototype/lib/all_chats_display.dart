import 'package:flutter/material.dart';
import 'single_chat_display.dart';
import 'top_bar.dart';
import 'get_chat_list.dart';

class AllChatsDisplay extends StatelessWidget {
  const AllChatsDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar('UNICHAT'),
      body: Center(
        child: ElevatedButton(
          child: chats(),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Writing()),
            );
          },
          style: ElevatedButton.styleFrom(primary: Colors.grey),
        ),
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

class Writing extends StatelessWidget {
  const Writing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar('Engenharia de Software'),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 70,
              width: double.infinity,
              color: const Color.fromRGBO(249, 249, 249, 1),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(149, 0, 20, 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Write a message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: const Color.fromRGBO(149, 0, 20, 1),
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
