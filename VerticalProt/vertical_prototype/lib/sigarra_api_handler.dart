import 'class_info.dart';

class SigarraAPIhandler {
    static List<Class> getStudentClasses(int id) {
        List<Class> studentclasses = [Class("Algoritmos e Estruturas de Dados","L.EIC010"),Class("Bases de Dados","L.EIC011"),Class("Física II","L.EIC012"),Class("Laboratório de Desenho e Teste de Software","L.EIC013"), Class("Teoria da Computação","L.EIC014")];
        return studentclasses;
    }

}