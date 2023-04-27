import 'Allocation.dart';

class LabAllocation {
  List<Allocation> _allocations = [];

  List<Allocation> get allocations => this._allocations;
  set allocations(List<Allocation> value) => this._allocations = value;

  String StringRep() {
    return "A-${allocations[0].stringRep()}\n" +
        "B-${allocations[1].stringRep()}\n" +
        "C-${allocations[2].stringRep()}\n" +
        "D-${allocations[3].stringRep()}";
  }
}
