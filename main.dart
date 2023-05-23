import 'Classroom.dart';
import 'LinearFittingAlgorithm.dart';
import 'Subject.dart';
import 'Teacher.dart';

void main(List<String> args) {
  List<Teacher> teachers1 = new List.generate(20, (_) => new Teacher());

  teachers1[0].name = "Dr. Jyoti Surve";
  teachers1[0].shortName = "JS";
  teachers1[0].subjects = [
    Subject.param("PBL", "214458", "SE-A", false, 8),
    Subject.param("Elective-V", "414451", "BE", true, 3)
  ];

  teachers1[1].name = "Prof. Sarang Saoji";
  teachers1[1].shortName = "SS";
  teachers1[1].subjects = [
    Subject.param("CG", "214453", "SE-A", true, 3),
    Subject.param("CGL", "214457", "SE-A", false, 8),
    Subject.param("PBL", "214458", "SE-B", false, 4)
  ];

  teachers1[2].name = "Dr. Bhavana Kanawade";
  teachers1[2].shortName = "BK";
  teachers1[2].subjects = [
    Subject.param("PBL", "214458", "SE-B", false, 4),
    Subject.param("HC", "310503", "TE", true, 4),
    Subject.param("LP-V", "414454", "BE", false, 6),
    Subject.param("AC", "414457", "BE", true, 1)
  ];

  teachers1[3].name = "Prof. Keshav Tambre";
  teachers1[3].shortName = "KT";
  teachers1[3].subjects = [
    Subject.param("DBMS", "214452", "SE-A", true, 3),
    Subject.param("DBMSL", "214456", "SE-A", false, 12),
    Subject.param("AC", "214459", "SE-A", true, 1)
  ];

  teachers1[4].name = "Prof. Nilesh Mali";
  teachers1[4].shortName = "NDM";
  teachers1[4].subjects = [
    Subject.param("PBL", "214458", "SE-B", false, 8),
    Subject.param("CC", "314454", "TE", true, 3),
    Subject.param("LP-II", "314458", "TE", false, 6)
  ];

  teachers1[5].name = "Prof. Sonali Patil";
  teachers1[5].shortName = "SP";
  teachers1[5].subjects = [
    Subject.param("AI", "314454", "TE", true, 3),
    Subject.param("LP-II", "314458", "TE", false, 2),
    Subject.param("Elective-VI", "414452", "BE", true, 3),
    Subject.param("LP-VI", "414455", "BE", false, 6)
  ];

  teachers1[6].name = "Prof. Prashant Mandale";
  teachers1[6].shortName = "PM";
  teachers1[6].subjects = [
    Subject.param("DSBD", "314452", "TE", true, 3),
    Subject.param("DSBDL", "314457", "TE", false, 8),
    Subject.param("S&E", "414453", "BE", true, 3),
  ];

  teachers1[7].name = "Prof. Kamna Sahu";
  teachers1[7].shortName = "KS";
  teachers1[7].subjects = [
    Subject.param("PA", "214451", "SE-A", true, 3),
    Subject.param("PSDL", "214455", "SE-A", false, 8),
    Subject.param("PA", "214451", "SE-B", true, 3),
    Subject.param("PSDL", "214455", "SE-B", false, 2)
  ];

  teachers1[8].name = "Prof. Megha Mehar";
  teachers1[8].shortName = "MM";
  teachers1[8].subjects = [
    Subject.param("PBL", "214458", "SE-A", false, 4),
    Subject.param("CG", "214453", "SE-B", true, 3),
    Subject.param("CGL", "214457", "SE-B", false, 8)
  ];

  teachers1[9].name = "Prof. Pradnya Patange";
  teachers1[9].shortName = "PP";
  teachers1[9].subjects = [
    Subject.param("CNS", "314451", "TE", true, 3),
    Subject.param("CNSL", "314456", "TE", false, 12),
    Subject.param("AC6", "314459", "TE", true, 1)
  ];

  teachers1[10].name = "Prof. Monali Bansode";
  teachers1[10].shortName = "MB";
  teachers1[10].subjects = [
    Subject.param("WAD", "314453", "TE", true, 3),
    Subject.param("LP-II", "314458", "TE", false, 8),
    Subject.param("HC", "410503", "BE", true, 4)
  ];

  teachers1[11].name = "Prof. Sayali Sabale";
  teachers1[11].shortName = "SBS";
  teachers1[11].subjects = [
    Subject.param("PSDL", "214455", "SE-B", false, 6),
    Subject.param("DS", "414450", "BE", true, 3),
    Subject.param("LP-V", "414454", "BE", false, 6)
  ];

  teachers1[12].name = "Prof. Nitin Gulhane";
  teachers1[12].shortName = "NG";
  teachers1[12].subjects = [
    Subject.param("SE", "214454", "SE-A", true, 3),
    Subject.param("SE", "214454", "SE-B", true, 3),
    Subject.param("PBL", "214458", "SE-A", false, 4),
    Subject.param("PBL", "214458", "SE-B", false, 4),
  ];

  teachers1[13].name = "Prof. Mandar Datar";
  teachers1[13].shortName = "MD";
  teachers1[13].subjects = [
    Subject.param("M3", "207003", "SE-B", true, 3),
  ];

  teachers1[14].name = "Prof. Namdev Mhetre";
  teachers1[14].shortName = "NM";
  teachers1[14].subjects = [
    Subject.param("M3", "207003", "SE-A", true, 3),
  ];

  teachers1[15].name = "Prof. Prachi Nilekar";
  teachers1[15].shortName = "PN";
  teachers1[15].subjects = [
    Subject.param("DBMS", "214452", "SE-B", true, 3),
    Subject.param("DBMSL", "214456", "SE-B", false, 12)
  ];

  List<Classroom> classrooms1 = new List.generate(13, (_) => new Classroom());

  classrooms1[0].roomNo = "314";

  classrooms1[1].roomNo = "315";

  classrooms1[2].roomNo = "309";

  classrooms1[3].roomNo = "214";
  classrooms1[3].isClass = false;
  classrooms1[3].subjects = ["CGL", "DBMSL", "CNSL"];

  classrooms1[4].roomNo = "213";
  classrooms1[4].isClass = false;
  classrooms1[4].subjects = ["DBMSL", "LP-II", "CNSL"];

  classrooms1[5].roomNo = "224";
  classrooms1[5].isClass = false;
  classrooms1[5].subjects = ["PBL", "DSBDL", "LP-II", "CGL"];

  classrooms1[6].roomNo = "225";
  classrooms1[6].isClass = false;
  classrooms1[6].subjects = ["DSBDL", "CGL"];

  classrooms1[7].roomNo = "316";
  classrooms1[7].isClass = false;
  classrooms1[7].subjects = ["PSDL"];

  classrooms1[8].roomNo = "317";
  classrooms1[8].isClass = false;
  classrooms1[8].subjects = ["PBL"];

  classrooms1[9].roomNo = "CC1";
  classrooms1[9].isClass = false;
  classrooms1[9].subjects = ["LP-V"];

  classrooms1[10].roomNo = "CC2";
  classrooms1[10].isClass = false;
  classrooms1[10].subjects = ["LP-V"];

  classrooms1[11].roomNo = "A6";
  classrooms1[11].isClass = false;
  classrooms1[11].subjects = ["LP-VI"];

  classrooms1[12].roomNo = "310";

  LinearFittingAlgorithm.infra.classes = classrooms1;
  LinearFittingAlgorithm.infra.teachers = teachers1;

  LinearFittingAlgorithm.fit();
  LinearFittingAlgorithm.printClassSchedule("SE-A");
  print("");
  LinearFittingAlgorithm.printTeacherSchedule(1);
  LinearFittingAlgorithm.printClassRoomSchedule(0);
}
