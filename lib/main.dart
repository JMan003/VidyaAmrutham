import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidyaamrutham/DLSA/components/dlsaDashboard.dart';
import 'package:vidyaamrutham/Login/login.dart';
import 'package:vidyaamrutham/Login/role.dart';
import 'package:vidyaamrutham/Parent/ParentDashboard.dart';
import 'package:vidyaamrutham/Parent/ParentProfile.dart';
import 'package:vidyaamrutham/Mentor/mentor.dart';

void main() {
  runApp(Vidyaamrutham());
}

class Vidyaamrutham extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskAid',
      theme: ThemeData(
        primaryColor: const Color(0x00000001A1C29), // Adjusted primary color
        scaffoldBackgroundColor:
            const Color(0x00000001A1C29), // Scaffold background color
        brightness: Brightness.dark, // Use dark theme

        hintColor: Colors.blue, // Accent color for text fields
        // To ensure text is visible against the dark background, adjust text colors accordingly
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
          // Adjust other text styles as needed
        ),
      ),
      home: AppLoader(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppLoader extends StatefulWidget {
  @override
  _AppLoaderState createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> {
  bool _isLoading = true;
  bool _isLoggedIn = false;
  String role = "";

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    // Check if user is logged in
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Get the username and role from shared preferences
    String username = prefs.getString('username') ?? '';
    role = prefs.getString('role') ?? '';

    bool isValidCookie = false;

    // Check if the username is not empty
    if (!username.isEmpty && !role.isEmpty) {
      isValidCookie = true;
    }

    setState(() {
      _isLoggedIn = isValidCookie;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return _isLoggedIn ? choosePage(role) : RoleChoose();
    }
  }

  choosePage(String role) {
    if (role == "parent") {
      return ParentDashboard();
      // } else if (role == "teacher") {
      //   return TeacherDashboardPage();
      // } else if (role == "student") {
      //   return StudentDashboardPage();
    } else if (role == "dlsa") {
      return DLSADashboard();
    } else if (role == "mentor") {
      return const Mentor();
    } else {
      return LoginPage();
    }
  }
}
