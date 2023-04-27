import 'Subject.dart';

class Classroom {
  bool _isClass = true;
  String _roomNo = "315";
  List<Subject> _subjects = [];
  List<List<String>> _schedule = [[]];

  Classroom();

  Classroom.param(this._isClass, this._roomNo, this._subjects, this._schedule);

  Classroom.copy(Classroom classroom) {
    this._isClass = classroom.isClass;
    this._roomNo = classroom.roomNo;
    this._subjects = classroom.subjects;
    this._schedule = classroom.schedule;
  }

  bool get isClass => this._isClass;
  set setIsClass(bool value) => this._isClass = value;
  get roomNo => this._roomNo;
  set setRoomNo(value) => this._roomNo = value;
  get subjects => this._subjects;
  set setSubjects(value) => this._subjects = value;
  get schedule => this._schedule;
  set setSchedule(value) => this._schedule = value;
}
