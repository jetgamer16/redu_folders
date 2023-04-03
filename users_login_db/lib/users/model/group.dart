import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:users_login_db/api/api_connection.dart';
import 'package:http/http.dart' as http;

class Group {
  int id;
  String name;
  String acronym;
  int user_teacher_id;

  Group(
    this.id,
    this.name,
    this.acronym,
    this.user_teacher_id
  );

  factory Group.fromJson(Map<String, dynamic> json) => Group(
    int.parse(json["id"]),
    json["name"],
    json["acronym"],
    int.parse(json["user_teacher_id"]),
  );

  Map<String, dynamic> toJson() => {
    'id' : id.toString(),
    'name' : name,
    'acronym' : acronym,
    'user_teacher_id' : user_teacher_id.toString(),

  };
}