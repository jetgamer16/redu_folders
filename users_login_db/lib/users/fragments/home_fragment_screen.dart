import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:users_login_db/users/fragments/dashboard_of_fragments.dart';
import 'package:users_login_db/users/fragments/favorites_fragment_screen.dart';
import 'package:http/http.dart' as http;
import 'package:users_login_db/api/api_connection.dart';
import 'package:users_login_db/users/model/group.dart';
import 'package:users_login_db/users/userPreferences/current_user.dart';

class HomeFragmentScreen extends StatelessWidget {
  final CurrentUser _currentUser = Get.put(CurrentUser());
  late List<Group> grupos = [];

  Future<dynamic> getData() async {
    var res = await http.post(
      Uri.parse(API.groups),
      body: {
        "user_id": "12",
      },
    );
    return res;
  }

  Future<void> showGroups() async {
    try {
      var res = await getData();

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        if (data["success"] == true) {
          for(var i = 0; i < data["groupsData"].length; i++) {
            Group group = Group.fromJson(data["groupsData"][i]);
            grupos.add(group);
          }
        } else {
          Fluttertoast.showToast(msg: "No groups at the moment");
        }
      }
    } catch (e) {
      print("Error :: " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: showGroups(),
        builder: ((context, snapshot) {
          return Scaffold(
              body: Column(
            children: <Widget>[
              for (var i = 0; i < grupos.length; i++) cuadro(grupos[i])
            ],
          ));
        }),
      ),
    );
  }
}

Widget cuadro(Group grupo) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          height: 100,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              grupo.name,
              style: TextStyle(
                  fontSize: 50, color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
        ),
      ]);
}
