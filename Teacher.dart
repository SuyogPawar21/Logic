import 'Subject.dart';

class Teacher {
  String _name = "";
  List<List<String>> _schedule =
      List.generate(5, (_) => List.generate(9, (_) => "Free"));
  List<Subject> _subjects = [new Subject()];
  String _shortName = "null";

  Teacher();

  Teacher.param(this._name, this._schedule, this._subjects, this._shortName);

  Teacher.copy(Teacher teacher) {
    this._name = teacher.name;
    this._schedule = teacher.schedule;
    this._subjects = teacher.subjects;
    this._shortName = teacher._shortName;
  }

  String get name => this._name;
  set name(String value) => this._name = value;
  get schedule => this._schedule;
  set schedule(value) => this._schedule = value;
  get subjects => this._subjects;
  set subjects(value) => this._subjects = value;
  String get shortName => this._shortName;
  set shortName(String value) => this._shortName = value;
}
