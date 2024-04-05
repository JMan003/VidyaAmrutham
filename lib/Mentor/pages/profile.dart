import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

String name = "", email = "", phone = "", gender = "", address = "";

class MentorProfile extends StatelessWidget {
  const MentorProfile({Key? key}) : super(key: key);

  Future<Map<String, dynamic>> getProfile() async {
    // Get the username and role from shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username') ?? '';

    var url = dotenv.env['SERVER'];
    var response = await http.get(
      Uri.parse('http://$url/mentor/profile/$username'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.body);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print('Data: $data');
      name = data['result']['mentor_name'];
      email = data['result']['email'];
      phone = data['result']['phone'];
      address = data['result']['address'];
      gender = data['result']['gender'];
      print(name);

      return data;
    } else {
      throw Exception('Failed to load profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: getProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Container(
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
              ),
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF514D4D),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Personal Information",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF514D4D),
                    ),
                  ),
                  SizedBox(
                    height: 260,
                    width: 400,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 240,
                          width: 320,
                          decoration: BoxDecoration(
                            color: Color(0xFFF3EDF7),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x26000000),
                                blurRadius: 3,
                                offset: Offset(0, 1),
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: Color(0x4C000000),
                                blurRadius: 2,
                                offset: Offset(0, 1),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 40),
                                    child: Text(
                                      "Name :",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF514D4D),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20, top: 40),
                                    child: Text(
                                      name,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF9C9898),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      "Address :",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF514D4D),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Text(
                                      address,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF9C9898),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      "Email :",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF514D4D),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Text(
                                      email,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF9C9898),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      "Phone :",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF514D4D),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Text(
                                      phone,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF9C9898),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      "Gender :",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF514D4D),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Text(
                                      gender,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF9C9898),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
