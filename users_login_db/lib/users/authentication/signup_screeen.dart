import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:users_login_db/api/api_connection.dart';
import 'package:users_login_db/users/authentication/login_screen.dart';
import 'package:http/http.dart' as http;

import '../model/user.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("SignUp Screen"), automaticallyImplyLeading: false),
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
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  validateUserEmail() async {
    try{

      var res = await http.post(
        Uri.parse(API.validateEmail),
        body: {
          'user_email' : emailController.text.trim(),
        },
        );

        if(res.statusCode == 200) {
          var resBodyofValidateEmail = await jsonDecode(jsonEncode(res.body));

          if(resBodyofValidateEmail == 'new') {
            registerAndSaveUserRecord();
          } else {
            Fluttertoast.showToast(msg: "Email is already in someone else use. Try another email.");
          }
        }

    } catch(e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());  
    }
  }

  registerAndSaveUserRecord() async {
    User userModel = User(
      1,
      nameController.text.trim(),
      emailController.text.trim(),
      passwordController.text.trim()
    );

    try{

      var res = await http.post(
        Uri.parse(API.signUp),
        body: userModel.toJson(),
      );

      if(res.statusCode == 200) {
        var resBodyOfSignUp = await jsonDecode(jsonEncode(res.body));
        print(resBodyOfSignUp);
        if(resBodyOfSignUp == 'success') {
          Fluttertoast.showToast(msg: "SignUp Successfully");
          setState(() {
            nameController.clear();
            emailController.clear();
            passwordController.clear();
          });
          Get.to(LoginScreeen());
        } else {
          Fluttertoast.showToast(msg: "Error ocurred. Try Again");
        }
      }

    } catch(e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
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
                  'Sign up',
                  style: TextStyle(fontSize: 20),
                )),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                        controller: nameController,
                        validator: (val) =>
                            val == "" ? "Please write name" : null,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User Name',
                        )),
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
                      child: const Text('Register'),
                      onPressed: () {
                        if(formKey.currentState!.validate()) {
                          validateUserEmail();
                        }
                      },
                    )),
                  ],
                )),
            Row(
              children: <Widget>[
                const Text('Do you have account?'),
                TextButton(
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Get.to(LoginScreeen());
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}
