import 'sigarra_api_handler.dart';
import 'class_info.dart';

class Student {
  static int id = 0;
  static String nome = "";
  static List<ClassInfo> classes = [];
  static Student? instance;

  static _student(int id1, String nome1) {
    id = id1;
    nome = nome1;
    classes = SigarraAPIhandler.getStudentClasses(id);
  }

  static Student? singleton(int id, String nome) {
    instance ??= _student(id, nome);
    return instance;
  }
}
