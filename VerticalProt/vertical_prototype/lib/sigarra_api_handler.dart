import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class SigarraAPIhandler {
    static List<Class> getStudentClasses(Student st) {
        
        List<String> classes = ["L.EIC010", "L.EIC011", "L.EIC012", "L.EIC013", "L.EIC014"];
        List<String> class_desc = ["Algoritmos e Estruturas de Dados", "Bases de Dados", "Física II", "Laboratório de Desenho e Teste de Software", "Teoria da Computação"];

        List<Class> student_classes;
        for (int i = 0; i < 4; i++) {
          student_classes.add(Class(classes[i], class_desc[i]));
        }

        return student_classes;

    }

}