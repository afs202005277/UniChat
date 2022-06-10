import 'dart:math';

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'top_bar.dart';
import 'package:uni/model/profile_page_model.dart';
import 'package:uni/utils/constants.dart' as Constants;
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:url_launcher/url_launcher.dart';

class Writing extends StatelessWidget {
  final String nameToTopBar;
  const Writing(this.nameToTopBar, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final String senderName = Constants.name;
    return Scaffold(
      appBar: TopBar(nameToTopBar),
      body: Stack(
        children: <Widget>[
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection(nameToTopBar)
                .orderBy('timeAndDate', descending: true)
                .snapshots(), // get all messages from firebase
            builder: (
              BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot,
            ) {
              if (!snapshot.hasData) return const SizedBox.shrink();
              return ListView.builder(
                reverse: true,
                itemCount: snapshot.data.docs.length,
                padding: const EdgeInsets.only(bottom: 70, top: 10),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final docData =
                      snapshot.data?.docs[index].data() as Map<String, dynamic>;
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 14),
                    child: Align(
                      alignment: (docData['nameOfWriter'] == senderName)
                          ? Alignment.topLeft
                          : Alignment.topRight,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width / 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: (docData['nameOfWriter'] == senderName)
                              ? const BorderRadius.only(
                                  topRight: Radius.circular(26),
                                  bottomLeft: Radius.circular(26),
                                  bottomRight: Radius.circular(26))
                              : const BorderRadius.only(
                                  topLeft: Radius.circular(26),
                                  bottomLeft: Radius.circular(26),
                                  bottomRight: Radius.circular(26)),
                          color: (docData['nameOfWriter'] == senderName)
                              ? const Color.fromRGBO(149, 0, 20, 1)
                              : const Color.fromRGBO(47, 47, 47, 1),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment:
                              (docData['nameOfWriter'] == senderName)
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment:
                                  (docData['nameOfWriter'] == senderName)
                                      ? CrossAxisAlignment.start
                                      : CrossAxisAlignment.end,
                              children: [
                                Text(
                                  docData['nameOfWriter'],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(203, 203, 203, 1),
                                  ),
                                ),
                                (docData['type'] != "image")
                                    ? (docData['type'] == "other")
                                        ? Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () async {
                                                    final String url =
                                                        docData['message'];
                                                    await launch(url);
                                                  },
                                                  icon: Icon(
                                                      Icons.arrow_circle_down)),
                                              Text(
                                                docData['name'],
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          )
                                        : Text(
                                            docData['message'],
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                          )
                                    : Image.network(docData['message']),
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
                                      .padLeft(2, '0') +
                                  ':' +
                                  (docData['timeAndDate'] as Timestamp)
                                      .toDate()
                                      .minute
                                      .toString()
                                      .padLeft(2, '0'),
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
                  FloatingActionButton(
                    onPressed: () async {
                      FilePickerResult result =
                          await FilePicker.platform.pickFiles();
                      if (result != null) {
                        File file = File(result.files.single.path);
                        String fileName = result.files.single.name;
                        final storage =
                            firebase_storage.FirebaseStorage.instance;
                        try {
                          await storage.ref('files/$fileName').putFile(file);
                          String downloadURL = await storage
                              .ref('files/$fileName')
                              .getDownloadURL();
                          FirebaseFirestore.instance
                              .collection(nameToTopBar)
                              .add({
                            'nameOfWriter': senderName,
                            'message': downloadURL,
                            'type': (result.files.single.extension == "png" ||
                                    result.files.single.extension == "jpg")
                                ? "image"
                                : "other",
                            'name': fileName,
                            'timeAndDate': DateTime.now()
                          });
                        } catch (e) {
                          print('error occured');
                        }
                      }
                    },
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                    backgroundColor: const Color.fromRGBO(149, 0, 20, 1),
                    elevation: 0,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                          hintText: 'Write a message...',
                          hintStyle: TextStyle(color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black54),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black54),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      FirebaseFirestore.instance.collection(nameToTopBar).add({
                        'nameOfWriter': senderName,
                        'message': textController.text,
                        'timeAndDate': DateTime.now()
                      });
                      textController.clear();
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
