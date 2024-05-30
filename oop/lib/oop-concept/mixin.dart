// mixin : keyword : code reusability

mixin CanFly {
  void fly() {
    print('fly');
  }
}

mixin CanWalk {
  void walk() {
    print('walk');
  }
}

class Bird with CanFly, CanWalk {}

class Human with CanFly, CanWalk {}

void main() {
  Bird b1 = Bird();
  b1.fly();
  b1.walk();

  Human h1 = Human();
  h1.walk();
}
