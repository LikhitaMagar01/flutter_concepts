// _ underscore for private validable or methods

class Employer {
  int? _employerId;
  String? _empName;

  int getEmployerId() {
    return _employerId!;
  }

  String getEmployerName() {
    return _empName!;
  }

  void setEmployerId(id) {
    _employerId = id;
  }

  void setEmployerName(name) {
    _empName = name;
  }
}

// final : use final in order to make the variable constant and non-changable

class Student {
  final _name = "Std name";

  String getName() {
    return _name;
  }
}

void main() {
  Employer em1 = Employer();
  em1.setEmployerId(2);
  em1.setEmployerName('lili');
  print(em1.getEmployerId());
  print(em1.getEmployerName());

  Student st1 = Student();
  print(st1.getName());
  // st1.setName('std name2'); not allowed
}
