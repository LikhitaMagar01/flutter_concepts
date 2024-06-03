// abstract class

// syntax

// abstract class ClassName {
//   method1();
//   method2();
// }

abstract class Bank {
  String name;
  double rate;

  Bank(this.name, this.rate);

  void interest();

  void display() {
    print('bank name $name');
  }
}

class NIC extends Bank {
  NIC(String name, double rate) : super(name, rate);

  @override
  void interest() {
    print('rate in NIC is $rate');
  }
}

class Nabil extends Bank {
  Nabil(String name, double rate) : super(name, rate);

  @override
  void interest() {
    print('rate in Nabil is $rate');
  }
}

void main() {
  NIC nic = NIC('NIC', 3.9);
  Nabil n = Nabil('Nabil', 4.0);
  nic.interest();
  n.interest();
  nic.display();
  n.display();

  Rectangle r1 = Rectangle(12, 20);
  r1.area();
  r1.perimeter();
}

// interface : rules for the class; defines the capabilities of a class

// syntax

// class InterfaceName {}
// class ClassName implements InterfaceName {}

// multiple inheritance using interface

// class ClassName implements Interface1, Interface2, Interface3 {}

abstract class Area {
  void area();
}

abstract class Perimeter {
  void perimeter();
}

class Rectangle implements Area, Perimeter {
  int length, breadth;

  Rectangle(this.length, this.breadth);

  @override
  void area() {
    print('area of rectangle: ${length * breadth}');
  }

  @override
  void perimeter() {
    print('perimeter of rectangle: ${2 * (length + breadth)}');
  }
}
