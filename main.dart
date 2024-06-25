import 'package:flutter/material.dart';
import 'package:linuxworld/ProfilePage.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final List<String> imagePaths = [
    // Replace with your actual image paths
    'images/lw.jpg',
    'images/AI.jpg',
    'images/mlops.jpg',
    'images/python.jpg',
    'images/thecreator.jpg',
    'images/fullstackwebapp.jpg',
    'images/rhcsa.jpg',
    'images/summer.jpg',
    'images/success.jpg',
    // ... Add more image paths here
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return SafeArea(
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                print('Button clicked!');
                Navigator.push(
                  context, // Now has access to Navigator
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              backgroundColor: Colors.red,
              child: Icon(Icons.person),
            ),
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(45, 0, 0, 0),
                  child: Text(
                    'Linux World!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: "VT323"),
                  ),
                ),
              ),
              leading: Padding(
                padding: const EdgeInsets.all(1.0),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    size: 30,
                    Icons.list,
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.message,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
              leadingWidth: BorderSide.strokeAlignCenter,
            ),
            body: SafeArea(
              child: ListView.builder(
                itemCount: imagePaths.length, // Adjust for image count
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0), // Adjust padding as desired
                    child: Column(
                      children: [
                        Image.asset(imagePaths[index]),
                        SizedBox(height: 16.0), // Add spacing between images
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
