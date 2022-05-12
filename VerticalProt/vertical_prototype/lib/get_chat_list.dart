import 'package:vertical_prototype/chat_info.dart';
import 'sigarra_api_handler.dart';

class GetChatList {
  static List<ChatInfo> fetchAll(int id) {
    SigarraAPIhandler.getStudentClasses(id);

    ChatInfo c1 = ChatInfo('DA', 'Desenho de Algoritmos', '2LEIC03', 11);
    ChatInfo c2 = ChatInfo('ES', 'Engenharia de Software', '2317', 72);
    ChatInfo c3 = ChatInfo('ME', 'Métodos Estatísticos', '2LEIC11', 5);
    ChatInfo c4 = ChatInfo('SO', 'Sistemas Operativos', '2LEIC10', 17);
    ChatInfo c5 = ChatInfo('LC', 'Laboratório de Computadores', '2311', 2);
    return [c1, c2, c3, c4, c5];
  }
}
