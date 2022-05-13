import 'sigarra_api_handler.dart';

class BackendServer {
  static getStudentChatRooms(int id) {
    return SigarraAPIhandler.getStudentClasses(id);
  }
}
