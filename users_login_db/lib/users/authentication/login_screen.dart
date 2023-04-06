import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:users_login_db/users/authentication/signup_screeen.dart';
import 'package:users_login_db/api/api_connection.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:users_login_db/users/fragments/dashboard_of_fragments.dart';
import 'package:users_login_db/users/userPreferences/user_preferences.dart';

import '../model/user.dart';

class LoginScreeen extends StatefulWidget {
  @override
  State<LoginScreeen> createState() => _LoginScreeenState();
}

class _LoginScreeenState extends State<LoginScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("Login Screen"), automaticallyImplyLeading: false),
      body: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  loginUserNow() async {
    try {
      var res = await http.post(
        Uri.parse(API.login),
        body: {
          "user_email": emailController.text.trim(),
          "user_password": passwordController.text.trim(),
        },
      );

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        if (data["success"] == true) {
          Fluttertoast.showToast(msg: "Login Successfully");
          print(data["userData"]);
          User userInfo = User.fromJson(data["userData"]);
          await RememberUserPrefs.storeUserInfo(userInfo);

          Get.to(DashboardOfFragments());
          
        } else {
          Fluttertoast.showToast(
              msg: "Writte correct password or email. Try Again");
        }
      }
    } catch (e) {
      print("Error :: " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'REDU',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                )),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                        controller: emailController,
                        validator: (val) =>
                            val == "" ? "Please write email" : null,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'e-mail',
                        )),
                    TextFormField(
                      controller: passwordController,
                      validator: (val) =>
                          val == "" ? "Please write password" : null,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      obscureText: true,
                    ),
                    Material(
                        child: ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          loginUserNow();
                        }
                      },
                    )),
                  ],
                )),
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Get.to(SignUpScreen());
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}
