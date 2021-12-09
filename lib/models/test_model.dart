// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TestModel {
  final String name;
  final String surname;
  TestModel({
    required this.name,
    required this.surname,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'surname': surname,
    };
  }

  factory TestModel.fromMap(Map<String, dynamic> map) {
    return TestModel(
      name: (map['name'] ?? '') as String,
      surname: (map['surname'] ?? '') as String,
    );
  }

  factory TestModel.fromJson(String source) => TestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TestModel &&
      other.name == name &&
      other.surname == surname;
  }
}
