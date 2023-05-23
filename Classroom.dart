class Classroom {
  bool _isClass = true;
  String _roomNo = "";
  List<String> _subjects = [];
  List<List<String>> _schedule =
      List.generate(5, (_) => List.generate(9, (_) => "Free"));

  Classroom();

  Classroom.param(this._isClass, this._roomNo, this._subjects, this._schedule);

  Classroom.copy(Classroom classroom) {
    this._isClass = classroom.isClass;
    this._roomNo = classroom.roomNo;
    this._subjects = classroom.subjects;
    this._schedule = classroom.schedule;
  }

  bool get isClass => this._isClass;
  set isClass(bool value) => this._isClass = value;
  get roomNo => this._roomNo;
  set roomNo(value) => this._roomNo = value;
  get subjects => this._subjects;
  set subjects(value) => this._subjects = value;
  get schedule => this._schedule;
  set schedule(value) => this._schedule = value;
}
