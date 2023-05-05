abstract class Allocation {
  bool _isTheory = true;

  bool get isTheory => this._isTheory;
  set isTheory(bool value) => this._isTheory = value;

  List<String> stringRep();
}
