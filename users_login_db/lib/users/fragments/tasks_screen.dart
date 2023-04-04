import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:users_login_db/api/api_connection.dart';
import 'package:users_login_db/users/fragments/task_form.dart';
import 'package:users_login_db/users/model/task.dart';
import 'package:users_login_db/users/userPreferences/current_user.dart';
import 'package:http/http.dart' as http;

class TasksScreen extends StatelessWidget {
  late CurrentUser _currentUser = Get.put(CurrentUser());
  late List<Task> tasks = [];

  final String idGroup;

  TasksScreen({super.key, required this.idGroup});

  Future<dynamic> getData(String idGroup) async {
    var res = await http.post(
      Uri.parse(API.tasks),
      body: {
        "group_id": idGroup,
      },
    );
    return res;
  }

  Future<void> showTasks() async {
    try {
      var res = await getData(idGroup);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        if (data["success"] == true) {
          for (var i = 0; i < data["tasksData"].length; i++) {
            Task task = Task.fromJson(data["tasksData"][i]);
            tasks.add(task);
          }
        } else {
          Fluttertoast.showToast(msg: "No task at the moment");
        }
      }
    } catch (e) {
      print("Error :: " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    tasks = [];
    return Center(
      child: FutureBuilder(
        future: showTasks(),
        builder: ((context, snapshot) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Tasks"),
                automaticallyImplyLeading: false,
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              body: Column(
                children: <Widget>[
                  for (var i = 0; i < tasks.length; i++)
                    cuadro(tasks[i], context)
                ],
              ));
        }),
      ),
    );
  }
}

Widget cuadro(Task task, context) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          height: 200,
          child: ElevatedButton(
            onPressed: () {
              var idTaskString = task.id;
              Navigator.push(context, MaterialPageRoute(builder: (context) => TaskForm(idTask: idTaskString)));
            },
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 8),
              children: [
                Text(
                  task.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25, color: Color.fromARGB(255, 255, 255, 255)),
                ),
                SizedBox(height: 8),
                Text(
                  task.description,
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 255, 255, 255)),
                ),
                SizedBox(height: 8),
                Text(
                  task.date_end.toString().substring(0, 10),
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ],
            ),
          ),
        ),
      ]);
}
