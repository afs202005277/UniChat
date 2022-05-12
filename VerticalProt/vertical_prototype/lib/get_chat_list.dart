import 'package:vertical_prototype/chat_info.dart';
import 'sigarra_api_handler.dart';
import 'class_info.dart';

class GetChatList {
  static List<ChatInfo> fetchAll(int id) {
    List<ClassInfo> classes = SigarraAPIhandler.getStudentClasses(id);
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
