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
          title: Text("SignUp"), automaticallyImplyLeading: false,centerTitle: true,backgroundColor: Colors.green.shade500,),
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
          Get.to(LoginScreen());
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
              child: Image.asset(
            "images/redulogolong.png",
            width: 300,
            height: 100,
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
                          labelText: 'Username',
                        )),
                    SizedBox(height: 15,),
                    TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Sorry, user can\'t be empty.';
                          } else if (!value.contains("@")) {
                            return 'Sorry, user You need to put an @ .';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        )),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Sorry, user can\'t be empty.';
                        } else if (value.length < 8) {
                          return 'Sorry, password lenght must be 8 characters or greater';
                        } else if (!value.contains(RegExp(r'^(?=.*[A-Z])'))) {
                          return 'La contraseña debe incluir al menos una letra mayúscula';
                        } else if (!value.contains(RegExp(r'^(?=.*\d)'))) {
                          return 'La contraseña debe incluir al menos un número';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 15,),
                    Material(
                        child:
                        ElevatedButton(
                          child: const Text('Register',style: TextStyle(fontSize: 16)),
                          onPressed: () {
                            if(formKey.currentState!.validate()) {
                              validateUserEmail();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(450, 20),
                            foregroundColor: Colors.white, backgroundColor: Colors.green.shade800,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                            elevation: 5,
                          ),
                        )),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Do you have account?',style: TextStyle(fontSize: 16),),
                TextButton(
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20,color: Colors.green),
                  ),
                  onPressed: () {
                    Get.to(LoginScreen());
                  },
                )
              ],
            ),
          ],
        ));
  }
}
