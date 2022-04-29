import 'class_info.dart';
import 'student_info.dart';

class SigarraAPIhandler {
  static List<ClassInfo> getStudentClasses(int id) {
    List<String> classes = ['2LEIC03', '2317', '2LEIC11', '2LEIC10', '2311'];
    List<String> classDesc = [
      'Desenho de Algoritmos',
      'Engenharia de Software',
      'Métodos Estatísticos',
      'Sistemas Operativos',
      'Laboratório de Computadores'
    ];

    List<String> acronyms = ['DA', 'ES', 'ME', 'SO', 'LC'];

    List<ClassInfo> studentClasses = [];
    for (int i = 0; i < classDesc.length; i++) {
      studentClasses.add(ClassInfo(classes[i], classDesc[i], acronyms[i]));
    }
    return studentClasses;
  }
}
