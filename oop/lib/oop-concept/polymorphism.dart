// polymorphism

// syntax:

// class ParentClass {
//   void functionName() {}
// }

// class ChildClass extends ParentClass {
//   @override
//   void functionName() {}
// }

class Vehicle {
  void run() {
    print("vehicle is running");
  }
}

class Car extends Vehicle {
  @override
  void run() {
    print("car is running");
  }
}

void main() {
  Vehicle v1 = Vehicle();
  v1.run();

  Car c1 = Car();
  c1.run();
}
