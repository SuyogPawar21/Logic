import 'Allocation.dart';
import 'Infra.dart';
import 'Schedules.dart';
import 'TheoryAllocation.dart';

class LinearFittingAlgorithm {
  static Map<String, int> _practicalSlots = {
    "SE-A": 4,
    "SE-B": 7,
    "TE": 0,
    "BE": 3
  };

  static List<int> _breakPositons = [2, 6];

  static Infra _infra = new Infra();

  static get getInfra => _infra;
  set setInfra(Infra infra) => _infra = infra;

  Map<String, int> get practicalSlots => _practicalSlots;
  set practicalSlots(Map<String, int> value) => _practicalSlots = value;

  static List<SubjectPosition> _getClassSubjects(String Class) {
    int teacherPos,
        subjectPos,
        subjectListLen,
        teacherListLen = _infra.teachers.length;

    List<SubjectPosition> classSubjects = List.empty(growable: true);

    for (teacherPos = 0; teacherPos < teacherListLen; teacherPos++) {
      subjectListLen = _infra.teachers[teacherPos].Subjects.length;
      for (subjectPos = 0; subjectPos < subjectListLen; subjectPos++) {
        if (_infra.teachers[teacherPos].Subjects[subjectPos].Class == Class) {
          classSubjects.add(new SubjectPosition(teacherPos, subjectPos));
        }
      }
    }
    return classSubjects;
  }

  static List<List<Allocation>> _classFit(String Class) {
    List<SubjectPosition> classSubjects = _getClassSubjects(Class);

    List<List<Allocation>> classTimeTable =
        new List.filled(5, new List.filled(9, new TheoryAllocation()));

    return classTimeTable;
  }

  static Schedules fit() {
    Map<String, List<List<Allocation>>> classSchedules = new Map();

    for (String Class in _practicalSlots.keys) {
      classSchedules[Class] = _classFit(Class);
    }

    return new Schedules();
  }
}

class SubjectPosition {
  int teacherPos, subjectPos;

  SubjectPosition(this.teacherPos, this.subjectPos);
}

void main(List<String> args) {}
