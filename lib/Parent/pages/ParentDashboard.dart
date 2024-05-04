import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidyaamrutham/Parent/components/ParentAttendance.dart';
import 'package:vidyaamrutham/Parent/components/achievements.dart';

double? containerHeight,
    innerContainerWidth,
    innerContainerHeight,
    controllerContainerWidth,
    controllerContainerHeight;
int admission_number = 0;

class ParentDashboard extends StatefulWidget {
  const ParentDashboard({Key? key}) : super(key: key);
  @override
  State<ParentDashboard> createState() => DashboardState();
}

class DashboardState extends State<ParentDashboard> {
  late String studentName = "",
      studentAdmissionNo = "",
      studentGrade = "",
      studentClass = "";

  Future<Map<String, dynamic>> getStudentData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var username = prefs.getString('username');
    print(username);
    var data = await http
        .get(Uri.parse('http://192.168.1.9:3001/parent/student/$username'));
    print(data.body);
    var jsonData = json.decode(data.body);

    studentName = jsonData['result']['name'];
    studentAdmissionNo = jsonData['result']['admission_no'].toString();
    studentGrade = jsonData['result']['class'].toString();
    studentClass = jsonData['result']['section'];
    admission_number = jsonData['result']['admission_no'];

    prefs.setString('studentId', jsonData['result']['id'].toString());

    return jsonData;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    containerHeight = screenHeight * 0.67;
    double screenWidth = MediaQuery.of(context).size.width;
    innerContainerWidth = screenWidth * 0.75;
    innerContainerHeight = screenHeight * 0.16;
    controllerContainerWidth = screenWidth * 0.85;
    controllerContainerHeight = screenHeight * 0.27;

    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
          future: getStudentData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return Scrollable(viewportBuilder:
                (BuildContext context, ViewportOffset position) {
              return Column(
                children: [
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
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                            left: 50,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Student Details',
                              style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 70, 70, 70)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 50,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: innerContainerWidth,
                              height: innerContainerHeight,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF7F2FA),
                                borderRadius: BorderRadius.circular(20),
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
                                                  color: Color.fromARGB(
                                                      255, 70, 70, 70)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Align(
                                                alignment: Alignment.topRight,
                                                child: Text(
                                                  studentName,
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
                                              'Admission No. :',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 70, 70, 70)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Align(
                                                alignment: Alignment.topRight,
                                                child: Text(
                                                  studentAdmissionNo,
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
                                              'Class :',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 70, 70, 70)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Align(
                                                alignment: Alignment.topRight,
                                                child: Text(
                                                  studentGrade,
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
                                              'Division :',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 70, 70, 70)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Align(
                                                alignment: Alignment.topRight,
                                                child: Text(
                                                  studentClass,
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
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20, left: 50),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Academic Details',
                              style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 70, 70, 70)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 30,
                          ),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                width: controllerContainerWidth,
                                height: controllerContainerHeight,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF7F2FA),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 20,
                                            left: 20,
                                          ),
                                          child: Align(
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    // Add the required functionality here
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const ParentAttendance()));
                                                  },
                                                  child: const Column(
                                                    children: [
                                                      Image(
                                                        image: AssetImage(
                                                            'assets/images/Attendance.png'),
                                                        width: 75,
                                                      ),
                                                      Text(
                                                        'Attendance',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    70,
                                                                    70,
                                                                    70)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 20,
                                            left: 43,
                                          ),
                                          child: Align(
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    // Add the required functionality here
                                                  },
                                                  child: const Column(
                                                    children: [
                                                      Image(
                                                        image: AssetImage(
                                                            'assets/images/Pass Fail.png'),
                                                        width: 75,
                                                      ),
                                                      Text(
                                                        'Results',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    70,
                                                                    70,
                                                                    70)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 20,
                                            left: 43,
                                          ),
                                          child: Align(
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    // Add the required functionality here
                                                  },
                                                  child: const Column(
                                                    children: [
                                                      Image(
                                                        image: AssetImage(
                                                            'assets/images/Exam.png'),
                                                        width: 75,
                                                      ),
                                                      Text(
                                                        'Exams',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    70,
                                                                    70,
                                                                    70)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 20,
                                            left: 0,
                                          ),
                                          child: Align(
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const Achievements()));
                                                  },
                                                  child: const Column(
                                                    children: [
                                                      Image(
                                                        image: AssetImage(
                                                            'assets/images/Prize.png'),
                                                        width: 75,
                                                      ),
                                                      Text(
                                                        'Achivements',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    70,
                                                                    70,
                                                                    70)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 20,
                                            left: 30,
                                          ),
                                          child: Align(
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    // Add the required functionality here
                                                  },
                                                  child: const Column(
                                                    children: [
                                                      Image(
                                                        image: AssetImage(
                                                            'assets/images/Yes Or No.png'),
                                                        width: 75,
                                                      ),
                                                      Text(
                                                        'Remarks',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    70,
                                                                    70,
                                                                    70)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            });
          }),
    );
  }
}
