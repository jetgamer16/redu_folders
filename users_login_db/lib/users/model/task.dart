import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:users_login_db/api/api_connection.dart';
import 'package:http/http.dart' as http;

class Task {
  int id;
  String title;
  String description;
  DateTime date_end;
  int user_teacher_id;
  int group_id;

  Task(
    this.id,
    this.title,
    this.description,
    this.date_end,
    this.user_teacher_id,
    this.group_id
  );

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    int.parse(json["id"]),
    json["title"],
    json["description"],
    DateTime.parse(json["date_end"]),
    int.parse(json["user_teacher_id"]),
    int.parse(json["group_id"]),
  );

  Map<String, dynamic> toJson() => {
    'id' : id.toString(),
    'title' : title,
    'description' : description,
    'date_end' : date_end,
    'user_teacher_id' : user_teacher_id.toString(),
    'group_id' : group_id.toString(),

  };
}