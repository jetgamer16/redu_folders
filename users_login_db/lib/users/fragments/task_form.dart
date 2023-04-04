import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class TaskForm extends StatelessWidget {

  TextEditingController caption = TextEditingController();

  File? imagePath;
  String? imageName;
  String? imageData;

  ImagePicker imagePicker = new ImagePicker();

  Future<void> getImage() async {
    var getImage = await imagePicker.pickImage(source: ImageSource.gallery);
    imagePath = File(getImage!.path);
    print(imagePath);
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(children: [
        SizedBox(height: 20,),
        TextFormField(
          controller: caption,
          decoration: InputDecoration(border: OutlineInputBorder(),
          label: Text('Enter the caption')
          ), 
        ),
        SizedBox(height: 20,),
        Image.file(imagePath!),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: (){
          getImage();
        }, child: Text('Chose Image')),
        ElevatedButton(onPressed: (){}, child: Text('Upload')),
      ],)
    );
  }
}