import 'class_info.dart';

class SigarraAPIhandler {
  static List<ClassInfo> getStudentClasses(Student st) {
    List<String> classes = [
      "L.EIC010",
      "L.EIC011",
      "L.EIC012",
      "L.EIC013",
      "L.EIC014"
    ];
    List<String> classDesc = [
      "Algoritmos e Estruturas de Dados",
      "Bases de Dados",
      "Física II",
      "Laboratório de Desenho e Teste de Software",
      "Teoria da Computação"
    ];

    List<ClassInfo> studentClasses = [];
    for (int i = 0; i < classDesc.length; i++) {
      studentClasses.add(ClassInfo(classes[i], classDesc[i]));
    }
    return studentClasses;
  }
}
