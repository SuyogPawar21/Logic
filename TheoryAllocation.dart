import 'Allocation.dart';

class TheoryAllocation extends Allocation {
  String _classRoom = "null";
  String _teacher = "null";
  String _subject = "null";

  String get classRoom => this._classRoom;
  set classRoom(String value) => this._classRoom = value;
  get teacher => this._teacher;
  set teacher(value) => this._teacher = value;
  get subject => this._subject;
  set subject(value) => this._subject = value;

  TheoryAllocation();

  TheoryAllocation.param(this._classRoom, this._teacher, this._subject);

  @override
  List<String> stringRep() {
    return ["$_subject $_teacher $_classRoom"];
  }
}
