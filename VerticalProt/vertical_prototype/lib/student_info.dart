import 'sigarra_api_handler.dart';
import 'class_info.dart';

class Student {
  static int id = 0;
  static String nome = "";
  static List<Class> classes = [];
  static Student? instance;

  static _Student(int id1, String nome1) {
    id = id1;
    nome = nome1;
    classes = SigarraAPIhandler.getStudentClasses(id);
  }

  static Student? singleton(int id, String nome) {
    instance ??= _Student(id, nome);
    return instance;
  }
}
