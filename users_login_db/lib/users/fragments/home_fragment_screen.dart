import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:users_login_db/api/api_connection.dart';
import 'package:users_login_db/users/fragments/tasks_screen.dart';
import 'package:users_login_db/users/model/group.dart';
import 'package:users_login_db/users/userPreferences/current_user.dart';

class HomeFragmentScreen extends StatelessWidget {
  late CurrentUser _currentUser = Get.put(CurrentUser());
  late List<Group> grupos = [];

  Future<dynamic> getData(int idUser) async {
    var idUserString = idUser.toString();
    var res = await http.post(
      Uri.parse(API.groups),
      body: {
        "user_id": idUserString,
      },
    );
    return res;
  }

  Future<void> showGroups() async {
    try {
      int idUser = _currentUser.user.id;

      var res = await getData(idUser);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        if (data["success"] == true) {
          for (var i = 0; i < data["groupsData"].length; i++) {
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
    grupos = [];
    return SafeArea(
      child: Center(

        child: FutureBuilder(
            future: showGroups(),
            builder: ((context, snapshot) {
              return Scaffold(
                resizeToAvoidBottomInset: true,
                body: Wrap(
                  spacing: 1.0,
                  runSpacing: 1.0,
                  children: <Widget>[
                    if (grupos.length != 0)
                      for (var i = 0; i < grupos.length; i+=2)
                        Row(
                          children: [
                            cuadro(grupos[i], context),
                            if (i+1 < grupos.length) cuadro(grupos[i+1], context),
                          ],
                        )
                    else
                      IgnorePointer(
                        child: Container(
                          child: const Center(
                            child: Text(
                              'You don\'t have any GROUP!',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          height: 627,
                        ),
                      ),
                  ],
                ),
              );
            })),
      ),
    );
  }


  Widget cuadro(Group grupo, context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(18.0),
            width: 150,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(51),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0DE409),
                  Color(0x920DE409),
                  Color(0xFF0DE409),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                var idGroupString = grupo.id.toString();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TasksScreen(idGroup: idGroupString)));
              },
              child: Text(
                grupo.acronym,
                style: TextStyle(
                    fontSize: 38,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.transparent, backgroundColor: Colors.transparent,
                padding: EdgeInsets.symmetric( horizontal: 40),
                textStyle: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(
                    color: Colors.black.withOpacity(0.5),
                    width: 3,
                  ),
                ),
                elevation: 0,
                shadowColor: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
        ],
    );
  }
}
