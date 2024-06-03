// set and get

// getter in dart

// syntax
// return_type get property_name {
// getter body
// }

class Student {
  String? _name;
  String? _surname;

  Student(this._name, this._surname);

  String get fullName => '$_name $_surname';

  Map<String, dynamic> get map {
    return {"name": _name, "surname": _surname};
  }
}

void main() {
  Student s1 = Student('namee', 'surname');
  print(s1.fullName);
  print(s1.map);

  University u1 = University('pcps', 2028);
  u1.display();
}

// setter in dart

// syntax
// set property_name (value) {
//   setter_body
// }

class University {
  String? _name;
  int? _year;

  University(this._name, this._year);

  set setName(name) {
    _name = name;
  }

  set setYear(int year) {
    if (year > 1900 && year < 2023) {
      throw Exception('year should be between 1900 to 2023');
    }
    _year = year;
  }

  void display() {
    print('name is ${_name}');
    print('year is ${_year}');
  }
}
