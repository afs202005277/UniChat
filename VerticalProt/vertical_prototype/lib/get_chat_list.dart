import 'package:vertical_prototype/backend_server.dart';
import 'package:vertical_prototype/chat_info.dart';
import 'backend_server.dart';
import 'class_info.dart';

class GetChatList {
  static List<ChatInfo> fetchAll(int id) {
    List<ClassInfo> classes = BackendServer.getStudentChatRooms(id);
    List<ChatInfo> res = [];

    List<int> numParticipants = [
      11,
      72,
      5,
      17,
      2
    ]; // replace by call to firebase
    int i = 0;

    for (final classeInfo in classes) {
      res.add(ChatInfo(classeInfo.code, classeInfo.fullName,
          classeInfo.classNumber, numParticipants[i]));
      i++;
    }
    return res;
  }
}
