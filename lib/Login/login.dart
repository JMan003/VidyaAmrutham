import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidyaamrutham/DLSA/components/dlsaDashboard.dart';
import 'package:vidyaamrutham/DLSA/sample_feature/sample_item_list_view.dart';
import 'package:vidyaamrutham/Parent/ParentDashboard.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool ishidepasswords = true;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Color(0xFFF3F3F3)),
        child: Column(children: [
          const SizedBox(
            height: 52,
          ),
          const Text("Login",
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Image.asset(
                'assets/images/tinywow_change_bg_photo_43354930.png'),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 50, right: 50, left: 50, bottom: 20),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      labelText: "Username",
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 50, right: 50, bottom: 30),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: passwordController,
                    obscureText: ishidepasswords,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        labelText: "Password",
                        suffixIcon: InkWell(
                          onTap: _conertPass,
                          child: const Icon(Icons.visibility),
                        )),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 130),
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 250),
                  child: FloatingActionButton.large(
                    backgroundColor: const Color(0xFF41BB95),
                    child: const Icon(Icons.arrow_forward),
                    onPressed: userValidation,
                  ),
                )
              ],
            ),
          ))
        ]),
      ),
    );
  }

  void _conertPass() {
    setState(() {
      ishidepasswords = !ishidepasswords;
    });
  }

  void userValidation() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String role = prefs.getString('role') ?? '';

    var username = usernameController.text;
    var password = passwordController.text;
    if(role == 'parent'){
      final response = await http.post(
          Uri.parse('http://192.168.0.207:3001/parent/login'),
          body: {'username': username, 'password': password}); 
      if (response.statusCode == 200) {
        prefs.setString('username', username);
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ParentDashboard()));
      } else {
        // ignore: use_build_context_synchronously
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Error"),
                content: const Text("Invalid username or password"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Close"))
                ],
              );
            });
      }
    }
    else if(role == 'student'){
      final response = await http.post(
          Uri.parse('http://192.168.0.207:3001/student/login'),
          body: {'username': username, 'password': password}); 
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        prefs.setString('username', username);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ParentDashboard()));
      } else {
        // ignore: use_build_context_synchronously
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Error"),
                content: const Text("Invalid username or password"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Close"))
                ],
              );
            });
      }
    }
  }
}
