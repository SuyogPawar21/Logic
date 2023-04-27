import 'Subject.dart';

class CourseAllocation {
  String _teacherName = "Sarang Saoji";
  List<Subject> _subjects = [];

  String get teacherName => this._teacherName;
  set teacherName(String value) => this._teacherName = value;
  get subjects => this._subjects;
  set subjects(value) => this._subjects = value;
}
