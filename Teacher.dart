import 'Subject.dart';

class Teacher {
  String _name = "Sarang Saoji";
  List<List<String>> _schedule = [[]];
  List<Subject> _subjects = [];

  Teacher();

  Teacher.param(this._name, this._schedule, this._subjects);

  Teacher.copy(Teacher teacher) {
    this._name = teacher.name;
    this._schedule = teacher.schedule;
    this._subjects = teacher.subjects;
  }

  String get name => this._name;
  set setName(String value) => this._name = value;
  get schedule => this._schedule;
  set setSchedule(value) => this._schedule = value;
  get subjects => this._subjects;
  set setSubjects(value) => this._subjects = value;
}
