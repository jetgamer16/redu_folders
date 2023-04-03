import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:users_login_db/users/authentication/login_screen.dart';
import 'package:users_login_db/users/fragments/dashboard_of_fragments.dart';
import 'package:users_login_db/users/userPreferences/user_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Redu App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: RememberUserPrefs.readUserInfo(),
        builder: (context, dataSnapShot) {
          if (dataSnapShot.data == null) {
            return LoginScreeen();
          } else {
            return DashboardOfFragments();
          }
        },
      ),
    );
  }
}
