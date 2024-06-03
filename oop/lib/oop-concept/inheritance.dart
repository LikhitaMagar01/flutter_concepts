// inheritance
// Syntax

// single inheritance
// class ParentClass {

// }

// class ChildClass extends ParentClass {}

// multilevel inheritance

// class ParentClass {}

// class ChildClass extends ParentClass {}

// class GrandChildClass extends ChildClass {}

// HIERARCHICAL inheritance

// class ParentClass {}

// class ChildClass extends ParentClass {}

// class AnotherChildClass extends ParentClass {}

// construction inheritance

// super : keyword for calling parent class method
class Vehicle {
  int? number = 4;
  Vehilce() {
    print("vehicle constructor");
  }

  Vehicle.roll() {
    print("named constructor");
  }
  void show() {
    print("show is called");
  }
}

class Car extends Vehicle {
  int? number = 10;

  Car() : super.roll() {
    print("car constructor");
    // calling method from parent using super keyword
    super.show();
    print("number from Car is ${number}");
    print("number is from Vehicle ${super.number}");
  }
}

void main() {
  Car c1 = Car();
  c1.show();
}
