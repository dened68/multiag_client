import 'package:flutter/cupertino.dart';

class User {
  final int salary;
  final int id;

  final String FirstName;
  final String SecondName;

  User({
    required this.salary,
    required this.id,
    required this.FirstName,
    required this.SecondName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      salary: json['salary'],
      id: json['id'],
      FirstName: json['FirstName'],
      SecondName: json['SecondName'],
    );
  }
}
