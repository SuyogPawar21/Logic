import 'Allocation.dart';
import 'TheoryAllocation.dart';

class LabAllocation extends Allocation {
  List<Allocation> _allocations =
      new List.generate(4, (_) => new TheoryAllocation());

  List<Allocation> get allocations => this._allocations;
  set allocations(List<Allocation> value) => this._allocations = value;

  LabAllocation();

  LabAllocation.param(this._allocations);

  @override
  List<String> stringRep() {
    return [
      "A ${allocations[0].stringRep()[0]}",
      "B ${allocations[1].stringRep()[0]}",
      "C ${allocations[2].stringRep()[0]}",
      "D ${allocations[3].stringRep()[0]}"
    ];
  }
}
