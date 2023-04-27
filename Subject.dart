class Subject {
  String _name = "OOP";
  String _subjectCode = "11111";
  String _class = "SE-B";
  bool _isTheory = true;
  int _hoursAllocated = 3;

  Subject();

  Subject.copy(Subject subject) {
    this._name = subject.name;
    this._subjectCode = subject.subjectCode;
    this._class = subject.Class;
    this._isTheory = subject.isTheory;
    this._hoursAllocated = subject.hoursAllocated;
  }

  Subject.param(this._name, this._subjectCode, this._class, this._isTheory,
      this._hoursAllocated);

  String get name => _name;
  set setName(String name) => _name = name;
  String get subjectCode => _subjectCode;
  set setSubjectCode(String subjectCode) => _subjectCode = subjectCode;
  String get Class => _class;
  set setClass(String Class) => _class = Class;
  bool get isTheory => _isTheory;
  set setisTheory(bool isTheory) => _isTheory = isTheory;
  int get hoursAllocated => _hoursAllocated;
  set sethoursAllocated(int hoursAllocated) => _hoursAllocated = hoursAllocated;
}
