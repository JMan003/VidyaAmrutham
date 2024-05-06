import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidyaamrutham/DLSA/dlsa.dart';
import 'package:vidyaamrutham/Login/login.dart';
import 'package:vidyaamrutham/Login/role.dart';
import 'package:vidyaamrutham/Mentor/mentor.dart';
import 'package:vidyaamrutham/Parent/parent.dart';
import 'package:vidyaamrutham/Student/student.dart';
import 'package:vidyaamrutham/Teacher/teacher.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const Vidyaamrutham());
}

class Vidyaamrutham extends StatelessWidget {
  const Vidyaamrutham({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vidyaamrutham',
      theme: ThemeData(
        primaryColor: const Color(0x001a1c29), // Adjusted primary color
        scaffoldBackgroundColor:
            const Color(0x001a1c29), // Scaffold background color
        brightness: Brightness.dark, // Use dark theme

        hintColor: Colors.blue, // Accent color for text fields
        // To ensure text is visible against the dark background, adjust text colors accordingly
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          bodyMedium: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          // Adjust other text styles as needed
        ),
      ),
      home: const AppLoader(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppLoader extends StatefulWidget {
  const AppLoader({super.key});

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
    if (username.isNotEmpty && role.isNotEmpty) {
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
      return _isLoggedIn ? choosePage(role) : const RoleChoose();
    }
  }

  choosePage(String role) {
    if (role == "parent") {
      return const Parent();
    } else if (role == "teacher") {
      return const Teacher();
      } else if (role == "student") {
        return Student();
    } else if (role == "dlsa") {
      return const DLSA();
    } else if (role == "mentor") {
      return const Mentor();
    } else {
      return const LoginPage(role:'');
    }
  }
}
