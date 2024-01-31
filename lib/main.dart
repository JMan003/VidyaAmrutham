import 'package:flutter/material.dart';
import 'package:vidyaamrutham/Login/teacher1.dart';

void main() {
  runApp(VidyaamruthamApp());
}

class VidyaamruthamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vidyaamrutham',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Color(0xFFDADADA), // Set the main background color
      ),
      home: Teacher1(), // Reference the HomePage widget from home_page.dart
      debugShowCheckedModeBanner: false,
    );
  }
}
