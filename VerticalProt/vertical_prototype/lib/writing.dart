import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'top_bar.dart';

class Writing extends StatelessWidget {
  final String nameToTopBar;
  const Writing(this.nameToTopBar, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    List<String> names = ["Andre", "Joao", "Henrique", "Pedro", "Vitor"];
    var random = Random();
    var isMe = true;
    String senderName = names[random.nextInt(names.length)];
    return Scaffold(
      appBar: TopBar(nameToTopBar),
      body: Stack(
        children: <Widget>[
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection(nameToTopBar)
                .orderBy("timeAndDate", descending: true)
                .snapshots(), // get all messages from firebase
            builder: (
                BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot,
                ) {
              if (!snapshot.hasData) return const SizedBox.shrink();
              return ListView.builder(
                reverse: true,
                itemCount: snapshot.data!.docs.length,
                padding: const EdgeInsets.only(bottom: 70, top: 10),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final docData =
                  snapshot.data?.docs[index].data() as Map<String, dynamic>;
                  return Container(
                    key: const Key("messageCard"),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 14),
                    child: Align(
                      alignment: (docData["nameOfWriter"] == senderName)
                          ? Alignment.topLeft
                          : Alignment.topRight,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width / 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: (docData["nameOfWriter"] == senderName)
                              ? const BorderRadius.only(
                              topRight: Radius.circular(26),
                              bottomLeft: Radius.circular(26),
                              bottomRight: Radius.circular(26))
                              : const BorderRadius.only(
                              topLeft: Radius.circular(26),
                              bottomLeft: Radius.circular(26),
                              bottomRight: Radius.circular(26)),
                          color: (docData["nameOfWriter"] == senderName)
                              ? const Color.fromRGBO(149, 0, 20, 1)
                              : const Color.fromRGBO(47, 47, 47, 1),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment:
                          (docData["nameOfWriter"] == senderName)
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment:
                              (docData["nameOfWriter"] == senderName)
                                  ? CrossAxisAlignment.start
                                  : CrossAxisAlignment.end,
                              children: [
                                Text(
                                  docData["nameOfWriter"],
                                  key: const Key("name"),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(203, 203, 203, 1),
                                  ),
                                ),
                                Text(
                                  docData["message"],
                                  key: Key(docData["message"]),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                            Text(
                              (docData['timeAndDate'] as Timestamp)
                                  .toDate()
                                  .hour
                                  .toString()
                                  .padLeft(2, "0") +
                                  ":" +
                                  (docData['timeAndDate'] as Timestamp)
                                      .toDate()
                                      .minute
                                      .toString()
                                      .padLeft(2, "0"),
                              key: const Key("timestamp"),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(203, 203, 203, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ); // acede ao conteudo da mensagem do user Andre e manda isso para o ecra. A decoracao da mensagem deve ser feita aqui
                },
              );
            },
          ),
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
                        key: Key("addButton"),
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      key: const Key("messageInput"),
                      controller: textController,
                      decoration: const InputDecoration(
                          hintText: "Write a message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    key: const Key("actionSendButton"),
                    onPressed: () {
                      FirebaseFirestore.instance.collection(nameToTopBar).add({
                        "nameOfWriter": senderName,
                        "message": textController.text,
                        "timeAndDate": DateTime.now()
                      });
                      textController.clear();
                    },
                    child: const Icon(
                      Icons.send,
                      key: Key("sendButton"),
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
