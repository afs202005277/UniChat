import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'top_bar.dart';

class Writing extends StatelessWidget {
  final String nameToTopBar;
  const Writing(this.nameToTopBar, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    return Scaffold(
      appBar: TopBar(nameToTopBar),
      body: Stack(
        children: <Widget>[
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection(nameToTopBar)
                .snapshots(), // get all messages from firebase
            builder: (
              BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot,
            ) {
              if (!snapshot.hasData) return const SizedBox.shrink();
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  final docData = snapshot.data?.docs[index].data() as Map<
                      String,
                      dynamic>; // o metodo builder está a iterar pelas mensagens. A variavel docData tem a mensagem que estas a ler neste momento, no formato userName => conteudo da mensagem (é como se fosse um dicionario do python)
                  return ListTile(
                    title: Text(docData[
                        'Andre']), // acede ao conteudo da mensagem do user Andre e manda isso para o ecra. A decoracao da mensagem deve ser feita aqui
                  );
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
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection(nameToTopBar)
                          .add({"Andre": textController.text});
                    },
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
