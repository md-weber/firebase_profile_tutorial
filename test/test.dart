abstract class Parent {
  DateTime createdAt;

  startCar();
}

class ClassA implements Parent {
  DateTime createdAt;
  ClassA(this.createdAt);

  @override
  startCar() {
    print("Class A started");
  }
}

class ClassB implements Parent {
  DateTime createdAt;
  ClassB(this.createdAt);

  @override
  startCar() {
    print("Lululu");
  }
}

main() {
  List<Parent> _list = [
    ClassA(DateTime(null)),
    ClassB(DateTime(2020, 03, 04)),
    ClassA(DateTime(2020, 02, 04)),
    ClassB(DateTime(2020, 01, 04))
  ];
  _list
      .where((value) => value != null)
      .toList()
      .sort((a, b) => b.createdAt.compareTo(a.createdAt));
}
