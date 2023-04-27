import 'Allocation.dart';

class TheoryAllocation extends Allocation {
  String _classRoom = "315";
  String _teacher = "Sarang Saoji";
  String _subject = "OOP";

  String get classRoom => this._classRoom;
  set classRoom(String value) => this._classRoom = value;
  get teacher => this._teacher;
  set teacher(value) => this._teacher = value;
  get subject => this._subject;
  set subject(value) => this._subject = value;

  @override
  String stringRep() {
    return "$_subject-$_teacher-$_classRoom";
  }
}
