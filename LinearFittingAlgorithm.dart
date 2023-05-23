import 'dart:io';
import 'dart:math';
import 'Allocation.dart';
import 'Infra.dart';
import 'LabAllocation.dart';
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

  static List<int> _breakPositions = [2, 6];

  static Infra _infra = new Infra();

  static Schedules _schedules = new Schedules();

  static get schedules => _schedules;

  static printClassSchedule(String Class) {
    bool flag = false;
    for (int j = 0; j < 9; j++) {
      flag = false;
      if (_practicalSlots[Class] == j) {
        flag = true;
      }
      print("");
      for (int i = 0; i < 5; i++) {
        if (flag) {
          stdout.write(
              schedules.classSchedules[Class][i][j].stringRep()[0] + "  ");
          stdout.write(
              schedules.classSchedules[Class][i][j].stringRep()[1] + "  ");
          stdout.write(
              schedules.classSchedules[Class][i][j].stringRep()[2] + "  ");
          stdout.write(
              schedules.classSchedules[Class][i][j].stringRep()[3] + "  ");
        } else {
          stdout.write(
              schedules.classSchedules[Class][i][j].stringRep()[0] + "  ");
        }
      }
    }
  }

  static printTeacherSchedule(int teacherPos) {
    for (int j = 0; j < 9; j++) {
      print("");
      for (int i = 0; i < 5; i++) {
        stdout.write(
            schedules.teacherSchedules[teacherPos].schedule[i][j] + "  ");
      }
    }
    print("");
  }

  static printClassRoomSchedule(int classPos) {
    for (int j = 0; j < 9; j++) {
      print("");
      for (int i = 0; i < 5; i++) {
        stdout.write(
            schedules.classRoomSchedules[classPos].schedule[i][j] + "  ");
      }
    }
    print("");
  }

  static void fit() {
    Map<String, List<List<Allocation>>> classSchedules = new Map();

    for (String Class in _practicalSlots.keys) {
      classSchedules[Class] = _classFit(Class);
    }

    _schedules.classSchedules = classSchedules;
    _schedules.teacherSchedules = infra.teachers;
    _schedules.classRoomSchedules = infra.classes;
  }

  static List<List<Allocation>> _classFit(String Class) {
    List<SubjectPosition> classTheorySubjects = _getClassTheorySubjects(Class);
    List<SubjectPosition> classPracticalSubjects =
        _getClassPracticalSubjects(Class);
    List<SubjectPosition> cClassTheorySubjects = List.from(classTheorySubjects);
    List<SubjectPosition> cClassPracticalSubjects =
        List.from(classPracticalSubjects);

    List<List<Allocation>> classTimeTable = new List.generate(
        5, (_) => new List.generate(9, (_) => new TheoryAllocation()));

    for (int i = 0; i < 5; i++) {
      cClassTheorySubjects = List.from(classTheorySubjects);
      cClassPracticalSubjects = List.from(classPracticalSubjects);
      for (int j = 0; j < 9; j++) {
        if (_practicalSlots[Class] == j) {
          classTimeTable[i][j] = (Class != "BE")
              ? _fitPraticalSlot(cClassPracticalSubjects, i, j)
              : _fitBEPraticalSlot(cClassPracticalSubjects, i, j);
          j++;
        } else if (_breakPositions.contains(j)) {
          classTimeTable[i][j] = new TheoryAllocation.param(" ", "Break", "");
        } else {
          classTimeTable[i][j] = _fitTheorySlot(cClassTheorySubjects, i, j);
        }
      }
    }
    return classTimeTable;
  }

  static LabAllocation _fitPraticalSlot(
      List<SubjectPosition> cClassSubjects, int day, int slot) {
    LabAllocation labAllocation = new LabAllocation();
    int i;
    for (i = 0; i < 4; i++) {
      labAllocation.allocations[i] = _fitLabBatch(cClassSubjects, day, slot);
    }
    return labAllocation;
  }

  static LabAllocation _fitBEPraticalSlot(
      List<SubjectPosition> cClassSubjects, int day, int slot) {
    LabAllocation labAllocation = new LabAllocation();
    int i;
    for (i = 0; i < 3; i++) {
      labAllocation.allocations[i] = _fitLabBatch(cClassSubjects, day, slot);
    }
    return labAllocation;
  }

  static TheoryAllocation _fitLabBatch(
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

      if (subjectChoiceLimit == 100) {
        return new TheoryAllocation.param("", "null", "");
      }
    } while (!_isTeacherFree(teacherPos, day, slot) ||
        _getTeacherSubject(teacherPos, subjectPos).isTheory);

    int classPos = _getValidClassRoom(
        new SubjectPosition(teacherPos, subjectPos), false, day, slot);

    if (classPos == -1) {
      return new TheoryAllocation.param("", "null", "");
    }

    _getClassRoomSchedule(classPos)[day][slot] =
        _getTeacherSubject(teacherPos, subjectPos).name +
            " " +
            _getTeacherSubject(teacherPos, subjectPos).Class;

    _getTeacherSchedule(teacherPos)[day][slot] =
        _getTeacherSubject(teacherPos, subjectPos).name +
            " " +
            _getTeacherSubject(teacherPos, subjectPos).Class +
            " " +
            _getClassRoom(classPos).roomNo;

    cClassSubjects.removeAt(teacherClassPos);

    return new TheoryAllocation.param(
        _getClassRoom(classPos).roomNo,
        _getTeacher(teacherPos).shortName,
        _getTeacherSubject(teacherPos, subjectPos).name);
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

      if (subjectChoiceLimit == 100) {
        return new TheoryAllocation.param("", "null", "");
      }
    } while (!_isTeacherFree(teacherPos, day, slot) ||
        !_getTeacherSubject(teacherPos, subjectPos).isTheory);

    int classPos = _getValidClassRoom(
        new SubjectPosition(teacherPos, subjectPos), true, day, slot);

    if (classPos == -1) {
      return new TheoryAllocation.param("", "null", "");
    }
    _getClassRoomSchedule(classPos)[day][slot] =
        _getTeacherSubject(teacherPos, subjectPos).name +
            " " +
            _getTeacherSubject(teacherPos, subjectPos).Class;

    _getTeacherSchedule(teacherPos)[day][slot] =
        _getTeacherSubject(teacherPos, subjectPos).name +
            " " +
            _getTeacherSubject(teacherPos, subjectPos).Class +
            " " +
            _getClassRoom(classPos).roomNo;

    cClassSubjects.removeAt(teacherClassPos);

    return new TheoryAllocation.param(
        _getClassRoom(classPos).roomNo,
        _getTeacher(teacherPos).shortName,
        _getTeacherSubject(teacherPos, subjectPos).name);
  }

  static int _getValidClassRoom(
      SubjectPosition position, bool isTheory, int day, int slot) {
    int classPos;

    int classChoiceLimit = 0;

    if (isTheory) {
      do {
        classPos = Random().nextInt(_infra.classes.length);
        classChoiceLimit++;
        if (classChoiceLimit == 500) {
          return -1;
        }
      } while (!_infra.classes[classPos].isClass ||
          !_isClassFree(classPos, day, slot));
    } else {
      do {
        classPos = Random().nextInt(_infra.classes.length);
        classChoiceLimit++;
        if (classChoiceLimit == 500) {
          return -1;
        }
      } while (!_isValidClassRoom(classPos, position) ||
          !_isClassFree(classPos, day, slot));
    }

    return classPos;
  }

  static bool _isValidClassRoom(int classPos, SubjectPosition position) {
    String subjectName =
        _infra.teachers[position.teacherPos].subjects[position.subjectPos].name;
    for (String subject in _infra.classes[classPos].subjects) {
      if (subject == subjectName) {
        return true;
      }
    }
    return false;
  }

  static List<SubjectPosition> _getClassTheorySubjects(String Class) {
    int teacherPos,
        subjectPos,
        subjectListLen,
        teacherListLen = _infra.teachers.length;

    List<SubjectPosition> classSubjects = List.empty(growable: true);
    for (teacherPos = 0; teacherPos < teacherListLen; teacherPos++) {
      subjectListLen = _getTeacher(teacherPos).subjects.length;
      for (subjectPos = 0; subjectPos < subjectListLen; subjectPos++) {
        if (_getTeacherSubject(teacherPos, subjectPos).Class == Class &&
            _getTeacherSubject(teacherPos, subjectPos).isTheory) {
          classSubjects.add(new SubjectPosition(teacherPos, subjectPos));
        }
      }
    }
    return classSubjects;
  }

  static List<SubjectPosition> _getClassPracticalSubjects(String Class) {
    int teacherPos,
        subjectPos,
        subjectListLen,
        teacherListLen = _infra.teachers.length;

    List<SubjectPosition> classSubjects = List.empty(growable: true);
    for (teacherPos = 0; teacherPos < teacherListLen; teacherPos++) {
      subjectListLen = _getTeacher(teacherPos).subjects.length;
      for (subjectPos = 0; subjectPos < subjectListLen; subjectPos++) {
        if (_getTeacherSubject(teacherPos, subjectPos).Class == Class &&
            !_getTeacherSubject(teacherPos, subjectPos).isTheory) {
          classSubjects.add(new SubjectPosition(teacherPos, subjectPos));
        }
      }
    }
    return classSubjects;
  }

  static _getTeacher(int teacherPos) => _infra.teachers[teacherPos];

  static _getTeacherSubject(int teacherPos, int subjectPos) =>
      _infra.teachers[teacherPos].subjects[subjectPos];

  static _getTeacherSchedule(int teacherPos) =>
      _infra.teachers[teacherPos].schedule;

  static bool _isTeacherFree(int teacherPos, int day, int slot) {
    return _infra.teachers[teacherPos].schedule[day][slot] == "Free";
  }

  static bool _isClassFree(int classPos, int day, int slot) {
    return _infra.classes[classPos].schedule[day][slot] == "Free";
  }

  static _getClassRoomSchedule(int classPos) {
    return _infra.classes[classPos].schedule;
  }

  static _getClassRoom(int classPos) => _infra.classes[classPos];

  static Infra get infra => _infra;
  static set infra(Infra infra) => _infra = infra;
  static Map<String, int> get practicalSlots => _practicalSlots;
  static set practicalSlots(Map<String, int> value) => _practicalSlots = value;
}
