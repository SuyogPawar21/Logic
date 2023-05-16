import 'Classroom.dart';
import 'LinearFittingAlgorithm.dart';
import 'Subject.dart';
import 'Teacher.dart';

void main(List<String> args) {
  List<Teacher> teachers = new List.filled(20, new Teacher());

  teachers[0].name = "Dr. Jyoti Surve";
  teachers[0].shortName = "JS";
  teachers[0].subjects = [
    Subject.param("PBL", "214458", "SE-A", false, 8),
    Subject.param("ElectiveV", "414451", "BE", true, 3)
  ];

  teachers[1].name = "Prof. Sarang Saoji";
  teachers[1].shortName = "SS";
  teachers[1].subjects = [
    Subject.param("CG", "214453", "SE-A", true, 3),
    Subject.param("CGL", "214457", "SE-A", false, 8),
    Subject.param("PBL", "214458", "SE-B", false, 4)
  ];

  teachers[2].name = "Dr. Bhavana Kanawade";
  teachers[2].shortName = "BK";
  teachers[2].subjects = [
    Subject.param("PBL", "214458", "SE-B", false, 4),
    Subject.param("HC", "310503", "TE", true, 4),
    Subject.param("LP-V", "414454", "BE", false, 6),
    Subject.param("AC", "414457", "BE", true, 1)
  ];

  teachers[3].name = "Prof. Keshav Tambre";
  teachers[3].shortName = "KT";
  teachers[3].subjects = [
    Subject.param("DBMS", "214452", "SE-A", true, 3),
    Subject.param("CGL", "214456", "SE-A", false, 12),
    Subject.param("AC", "214459", "SE-A", true, 1)
  ];

  teachers[4].name = "Prof. Nilesh Mali";
  teachers[4].shortName = "NDM";
  teachers[4].subjects = [
    Subject.param("PBL", "214458", "SE-B", false, 8),
    Subject.param("CC", "314454", "TE", true, 3),
    Subject.param("LP-II", "314458", "TE", false, 6)
  ];

  teachers[5].name = "Prof. Sonali Patil";
  teachers[5].shortName = "SP";
  teachers[5].subjects = [
    Subject.param("AI", "314454", "TE", true, 3),
    Subject.param("LP-II", "314458", "TE", false, 2),
    Subject.param("Elective-VI", "414452", "BE", false, 4),
    Subject.param("LP-VI", "414455", "BE", false, 6)
  ];

  List<Classroom> classrooms = new List.empty(growable: true);

  LinearFittingAlgorithm.infra.classes = classrooms;
  LinearFittingAlgorithm.infra.teachers = teachers;

  LinearFittingAlgorithm.fit();
}
