import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

double? containerHeight,
    containerWidth,
    innerContainerWidth,
    innerContainerHeight,
    controllerContainerWidth,
    controllerContainerHeight;
String name = "", phoneNumber = "", emailId = "", address = "", subject = "";

class Teacher4 extends StatelessWidget {
  const Teacher4({Key? key}) : super(key: key);

  Future<Map<String, dynamic>> getStudentData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var username = prefs.getString('username');
    print(username);
    String? url = "387df06823a93fd406892e1c452f4b74.serveo.net";
    var data =
        await http.get(Uri.parse('http://$url/teacher/profile/$username'));
    var jsonData = json.decode(data.body);
    print(jsonData);
    name = jsonData['result']['name'];
    phoneNumber = jsonData['result']['phone'];
    emailId = jsonData['result']['email'];
    address = jsonData['result']['address'];
    subject = jsonData['result']['subject'];

    return jsonData;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    containerHeight = screenHeight * 0.67;
    double screenWidth = MediaQuery.of(context).size.width;
    containerWidth = screenWidth * 0.9;
    innerContainerWidth = screenWidth * 0.9;
    innerContainerHeight = screenHeight * 0.35;

    return FutureBuilder<Map<String, dynamic>>(
        future: getStudentData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Expanded(child: Container()),
              Container(
                height: containerHeight,
                width: double.infinity,
                decoration: const ShapeDecoration(
                  color: Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(63),
                      topRight: Radius.circular(63),
                    ),
                  ),
                ),
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        name,
                        style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Row(
                        children: [
                          const Align(
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Profile Details',
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 85, 85, 85)),
                              ),
                            ),
                          ),
                          Align(
                            child: GestureDetector(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: innerContainerWidth,
                    height: innerContainerHeight,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF7F2FA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadows: const [
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
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 20,
                            ),
                            child: Row(
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Name :',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 70, 70, 70)),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        name,
                                        style: const TextStyle(
                                            fontSize: 17,
                                            color: Color.fromARGB(
                                                255, 70, 70, 70)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 20,
                            ),
                            child: Row(
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Phone Number",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 70, 70, 70)),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        phoneNumber,
                                        style: const TextStyle(
                                            fontSize: 17,
                                            color: Color.fromARGB(
                                                255, 70, 70, 70)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 20,
                            ),
                            child: Row(
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Email ID :",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 70, 70, 70)),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        emailId,
                                        style: const TextStyle(
                                            fontSize: 17,
                                            color: Color.fromARGB(
                                                255, 70, 70, 70)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 20,
                            ),
                            child: Row(
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Subject :",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 70, 70, 70)),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        subject,
                                        style: const TextStyle(
                                            fontSize: 17,
                                            color: Color.fromARGB(
                                                255, 70, 70, 70)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 20,
                            ),
                            child: Row(
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Address :",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 70, 70, 70)),
                                  ),
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      address.length > 10
                                          ? '${address.substring(0, 20)}...'
                                          : address,
                                      style: const TextStyle(
                                          fontSize: 17,
                                          color:
                                              Color.fromARGB(255, 70, 70, 70)),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )),
                              ],
                            )),
                      ],
                    ),
                  )
                ]),
              )
            ],
          );
        });
  }
}
