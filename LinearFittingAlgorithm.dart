import 'dart:math';
import 'Allocation.dart';
import 'Infra.dart';
import 'Schedules.dart';
import 'TheoryAllocation.dart';

class SubjectPosition {
  int teacherPos, subjectPos;

  SubjectPosition(this.teacherPos, this.subjectPos);
}

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

  static _getTeacher(int teacherPos) => _infra.teachers[teacherPos];

  static _getTeacherSubject(int teacherPos, int subjectPos) =>
      _infra.teachers[teacherPos].subjects[subjectPos];

  static _getTeacherSchedule(int teacherPos) =>
      _infra.teachers[teacherPos].schedule;

  static bool _isTeacherFree(int teacherPos, int day, int slot) {
    return _infra.teachers.schedule[day][slot] == "Free";
  }

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

  static TheoryAllocation _fitTheorySlot(
      List<SubjectPosition> cClassSubjects, int day, int slot) {
    int teacherClassPos;
    int teacherPos;
    int subjectPos;

    int subjectChoiceLimit = 0;

    do {
      subjectChoiceLimit++;
      teacherClassPos = Random().nextInt(cClassSubjects.length);
      teacherPos = cClassSubjects[teacherClassPos].teacherPos;
      subjectPos = cClassSubjects[teacherClassPos].subjectPos;

      if (subjectChoiceLimit == 15) {
        return new TheoryAllocation();
      }
    } while (!_isTeacherFree(teacherPos, day, slot) ||
        !_getTeacherSubject(teacherPos, subjectPos).isTheory || 
        _getTeacherSubject(teacherPos, subjectPos));

    _getTeacherSchedule(teacherPos)[day][slot] =
        _getTeacherSubject(teacherPos, subjectPos).name +
            "-" 
            _getTeacherSubject(teacherPos, subjectPos).Class;

    cClassSubjects.removeAt(teacherClassPos);

    return new TheoryAllocation.param("Classroom", _getTeacher(teacherPos).name,
        _getTeacherSubject(teacherPos, subjectPos).name);
  }

  static List<List<Allocation>> _classFit(String Class) {
    List<SubjectPosition> classSubjects = _getClassSubjects(Class);
    List<SubjectPosition> cClassSubjects = List.from(classSubjects);

    List<List<Allocation>> classTimeTable =
        new List.filled(5, new List.filled(9, new TheoryAllocation()));

    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 9; j++) {
        if (_practicalSlots[Class] == j) {
        } else if (_breakPositons.contains(j)) {
          continue;
        } else {
          _fitTheorySlot(cClassSubjects, i, j);
        }
      }
    }

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

void main(List<String> args) {
  LinearFittingAlgorithm.fit();
}
