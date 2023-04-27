import 'Allocation.dart';
import 'Classroom.dart';
import 'Teacher.dart';

class Schedules {
  Map<String, List<List<Allocation>>> _classSchedules = {};
  List<Teacher> _teacherSchedules = [];
  List<Classroom> _classRoomSchedules = [];

  Schedules();

  Schedules.param(
      this._classSchedules, this._teacherSchedules, this._classRoomSchedules);

  Map<String, List<List<Allocation>>> get classSchedules =>
      this._classSchedules;

  set classSchedules(Map<String, List<List<Allocation>>> value) =>
      this._classSchedules = value;

  get teacherSchedules => this._teacherSchedules;

  set teacherSchedules(value) => this._teacherSchedules = value;

  get classRoomSchedules => this._classRoomSchedules;

  set classRoomSchedules(value) => this._classRoomSchedules = value;
}
