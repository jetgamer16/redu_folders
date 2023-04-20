import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:users_login_db/api/api_connection.dart';
import 'package:users_login_db/users/authentication/login_screen.dart';
import 'package:users_login_db/users/userPreferences/current_user.dart';
import 'package:users_login_db/users/userPreferences/user_preferences.dart';
import 'package:http/http.dart' as http;

class ProfilePicture extends StatefulWidget {
  final double size;

  ProfilePicture({required this.size});

  @override
  _ProfilePictureState createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  final CurrentUser _currentUser = Get.put(CurrentUser());
  File? _image;
  late String? _imageFile = '';


  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(pickedFile!.path);
    });

    final uri = Uri.parse(API.profilePhoto);
    var request = http.MultipartRequest('POST', uri);
    request.fields['id'] = _currentUser.user.id.toString();
    var pic = await http.MultipartFile.fromPath("image", _image!.path);
    request.files.add(pic);
    var response = await request.send();

    if(response.statusCode == 200) {
      print('image Uploaded');
    } else {
      print('image not Uploaded');
    }

    final uri2 = Uri.parse(API.profilePhoto2);
    var request2 = http.MultipartRequest('POST', uri2);
    request2.fields['id'] = _currentUser.user.id.toString();
    var pic2 = await http.MultipartFile.fromPath("image", _image!.path);
    request2.files.add(pic2);
    var response2 = await request2.send();

    if(response.statusCode == 200) {
      print('image Uploaded');
    } else {
      print('image not Uploaded');
    }

  }

  showImage() {
    
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _getImage,
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: _image != null
              ? DecorationImage(
            image: FileImage(_image!),
            fit: BoxFit.cover,
          )
              : null,
          border: Border.all(
            color: Colors.grey.shade400,
            width: 2.0,
          ),
        ),
        child: _image == null
            ? Icon(
          Icons.person,
          size: widget.size / 2,
          color: Colors.grey.shade400,
        )
            : null,
      ),
    );
  }
}



class ProfileFragmentScreen extends StatelessWidget {
  final CurrentUser _currentUser = Get.put(CurrentUser());

  signOutUser() async {
    var resultResponse = await Get.dialog(AlertDialog(
      backgroundColor: Colors.grey,
      title: const Text(
        "Logout",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      content: const Text("Are you sure?\nYou want to logout from app?"),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            "No",
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () {
            Get.back(result: "loggedOut");
          },
          child: const Text(
            "Yes",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    ));

    if (resultResponse == "loggedOut") {
      RememberUserPrefs.removeUserInfo().then((value) {
        Get.off(LoginScreen());
      });
    }
  }

  Widget userInfoItemProfile(IconData iconData, String userData) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 30,
            color: Colors.black,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            userData,
            style: const TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(32),
      children: [
        Center(
          child:  ProfilePicture(
            size: 240.0,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        userInfoItemProfile(Icons.person, _currentUser.user.name),
        const SizedBox(
          height: 20,
        ),
        userInfoItemProfile(Icons.email, _currentUser.user.email),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Material(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: () {
                signOutUser();
              },
              borderRadius: BorderRadius.circular(32),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                child: Text(
                  "Log Out",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

}