import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(30, 0, 10, 0),
              child: Text(
                'Linux World',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  // Handle action button tap
                },
                icon: Icon(
                  Icons.message,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: _image != null
                    ? FileImage(_image!)
                    : AssetImage('images/unnamed.png') as ImageProvider,
                radius: 70,
              ),
              SizedBox(
                  height: 10), // Add some spacing between the avatar and text
              Text(
                'anonymous-gtx',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "VT323",
                  fontSize: 24,
                ),
              ),
              SizedBox(
                  height:
                      20), // Add some spacing between the text and container
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  width: 250,
                  height: 50.0,
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image,
                        color: Colors.black,
                      ),
                      SizedBox(
                          width: 10), // Add spacing between the icon and text
                      Text(
                        'Change Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "VT323",
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
