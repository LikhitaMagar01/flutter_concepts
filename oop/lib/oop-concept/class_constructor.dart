class People {
  int? age;
  String? name;
  double? height;

  void display() {
    print('name $name');
  }

  double calculateAgeAfterSixYears(age) {
    return age! + 6;
  }

  void nextAge(newAge) {
    print('Your new age will be $newAge');
  }
}

class Home {
  String? name;
  String? address;
  int? numberOfRooms;

  void homeInfo() {
    print('name is $name');
    print('address is $address');
    print('numberOfRooms is $numberOfRooms');
  }
}

// with constructor
// constructor should be the same name as class
// constructor is called when the class is called

class Family {
  String? familyName;
  int? numberOfMember;

  // Family(String familyName, int numberOfMember) {
  //   this.familyName = familyName;
  //   this.numberOfMember = numberOfMember;
  // }

  // void display() {
  //   print('family name $familyName');
  //   print('number of member $numberOfMember');
  // }

// in single
  Family(this.familyName, this.numberOfMember);

  void display() {
    print('family name ${this.familyName}');
    print('number of member ${this.numberOfMember}');
  }
}

class DefaultValue {
  String? name;
  int? age;
  String? subject;
  double? defaultValue;
  DefaultValue(this.name, this.age,
      [this.subject = 'N/A', this.defaultValue = 5.5]); // subject and defaultValue is optional

  void display() {
    print('name ${this.name}');
    print('subject ${this.subject}');
    print('default value is ${this.defaultValue}');
  }
}

class NamedParameters {
  String? name;
  int? age;
  NamedParameters({this.name, this.age});

  void display() {
    print('name ${this.name}');
    print('age ${this.age}');
  }
}

class NamedParametersAndDefaultValue {
  String? name;
  int? age;
  NamedParametersAndDefaultValue({this.name = 'default name with params', this.age = 56});

  void display() {
    print('name ${this.name}');
    print('age ${this.age}');
  }
}

class Person {
  String? name;
  String? planet;

  Person() {
    this.planet = 'Earth';
  }

  void display() {
    print('name is ${this.name}');
    print('planet is ${this.planet}');
  }
}

class ConstantConstructor {
  final int? number;
  final String? name;

  const ConstantConstructor({this.name, this.number});

  void display() {
    print('const name field ${this.name}');
    print('const number field ${this.number}');
  }
}

void main() {
  People p1 = People();
  p1.age = 23;
  p1.name = 'Sami';
  p1.height = 5.5;
  p1.display();
  double newAge = p1.calculateAgeAfterSixYears(20.0);
  print(newAge);
  p1.nextAge(newAge);

  Home h1 = Home();
  h1.name = 'himalaya';
  h1.address = 'nepal';
  h1.numberOfRooms = 22;
  h1.homeInfo();

  Family f1 = Family('family from pahad', 5);
  f1.display();

  DefaultValue d1 = DefaultValue('angari', 30);
  d1.display();

  NamedParameters n1 = NamedParameters(name: 'name ho', age: 29);
  n1.display();

  NamedParametersAndDefaultValue np1 = NamedParametersAndDefaultValue();
  np1.display();

  Person pp1 = Person();
  pp1.name = 'manab';
  pp1.display();

  ConstantConstructor cc1 = const ConstantConstructor(name: 'ddmdmdm', number: 222);
  cc1.display();
}
