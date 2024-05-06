import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidyaamrutham/Parent/components/ExamView.dart';
import 'package:vidyaamrutham/Parent/components/ParentAttendance.dart';
import 'package:vidyaamrutham/Parent/components/Remarks.dart';
import 'package:vidyaamrutham/Parent/components/ResultsView.dart';
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

    String? url = dotenv.env['SERVER'];
    var username = prefs.getString('username');
    print(username);
    var data =
        await http.get(Uri.parse('https://$url/parent/student/$username'));
    print(data.body);
    var jsonData = json.decode(data.body);

    prefs.setString('student_id', jsonData['result']['student_id'].toString());

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
    innerContainerHeight = screenHeight * 0.22;
    controllerContainerWidth = screenWidth * 0.85;
    controllerContainerHeight = screenHeight * 0.37;

    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
          future: getStudentData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return Scrollable(viewportBuilder:
                (BuildContext context, ViewportOffset position) {
              return SingleChildScrollView(
              child: Column(
                children: [
                     Container(
                      //height: containerHeight,
                      width: double.infinity,
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(63),
                            topRight: Radius.circular(63),
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'Student Details',
                              style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 70, 70, 70)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: innerContainerWidth,
                              height: innerContainerHeight,
                              decoration: BoxDecoration(
                                color: Color(0xFFF3EDF7),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
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
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'Academic Details',
                              style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 70, 70, 70)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: controllerContainerWidth,
                              height: controllerContainerHeight,
                              decoration: BoxDecoration(
                                color: Color(0xFFF3EDF7),
                                borderRadius: BorderRadius.circular(20),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Align(
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
                                                        color: Color.fromARGB(
                                                            255, 70, 70, 70)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const ResultView()));
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
                                                        color: Color.fromARGB(
                                                            255, 70, 70, 70)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const ExamView()));
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
                                                        color: Color.fromARGB(
                                                            255, 70, 70, 70)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Align(
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Achievements()));
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
                                                        color: Color.fromARGB(
                                                            255, 70, 70, 70)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
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
                                                        color: Color.fromARGB(
                                                            255, 70, 70, 70)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    
                    ),
                  
                ],
              
              ),
              );
            });
          }),
    );
  }
}
