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
  late List<dynamic> taskRealized = [];

  final String idGroup;

  TasksScreen({super.key, required this.idGroup});

  Future<dynamic> getData(String idGroup) async {
    var res = await http.post(
      Uri.parse(API.tasks),
      body: {
        "group_id": idGroup,
        "user_id": _currentUser.user.id.toString()
      },
    );
    return res;
  }

  Future<void> showTasks() async {
    try {
      var res = await getData(idGroup);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        taskRealized = data["taskId"];

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

  findItem(int id) {
    for(int i = 0; i < taskRealized.length; i++) {
      if(int.parse(taskRealized[i]) == id) {
        return true;
      }
    }
    return false;
  }

  dateBefore(DateTime date) {
    DateTime now = new DateTime.now();
    if(now.isAfter(date)) {
      return true;
    } else {
      return false;
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
              resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                  for (var i = 0; i < tasks.length; i++)
                    if(dateBefore(tasks[i].date_end))
                      cuadro3(tasks[i], context)
                    else
                      if(findItem(tasks[i].id))
                        cuadro2(tasks[i], context)
                      else
                        cuadro(tasks[i], context)
                ],
                ),
              ));
        }),
      ),
    );
  }
}

Widget cuadro3(Task task, context) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          color: Colors.red,
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          height: 200,
          child: ElevatedButton(
            onPressed: () {
              Fluttertoast.showToast(msg: "Task not Realized");
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

Widget cuadro2(Task task, context) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          color: Colors.green,
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          height: 200,
          child: ElevatedButton(
            onPressed: () {
              Fluttertoast.showToast(msg: "Task realized");
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

Widget cuadro(Task task, context) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          color: Colors.yellow,
          margin: const EdgeInsets.all(20.0),
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
