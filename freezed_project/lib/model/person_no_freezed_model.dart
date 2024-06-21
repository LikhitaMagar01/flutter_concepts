// without freezed

class PersonModel {
  String? name;
  PersonModel({this.name});

  // when two obj is sent with same value it sent the same hashCode for both obj
  // initially the hasCode is different for different obj of same model
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is PersonModel && runtimeType == other.runtimeType && name == other.name;

  int get hasCode => name.hashCode;

  @override
  int get hashCode => name.hashCode;

  PersonModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }

  // override the previous value
  PersonModel copyWith({String? name}) {
    return PersonModel(name: name ?? name);
  }

  @override
  String toString() {
    return 'person: $name';
  }
}
