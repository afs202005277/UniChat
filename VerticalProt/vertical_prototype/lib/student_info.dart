import 'sigarra_api_handler.dart';
import 'class_info.dart';

class Student {
  int id = 0;
  String nome = "";
  List<Class> classes = [];
  Student(int id1, String nome1){
    this.id = id1;
    this.nome = nome1;
    this.classes = SigarraAPIhandler.getStudentClasses(this.id);
  }
}

