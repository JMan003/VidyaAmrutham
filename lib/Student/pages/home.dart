import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:convert';
import 'package:vidyaamrutham/Parent/components/ExamView.dart';
import 'package:vidyaamrutham/Parent/components/ResultsView.dart';
import 'package:vidyaamrutham/Student/components/Attendance.dart';

class StudentHome extends StatelessWidget {
  const StudentHome({Key? key}) : super(key: key);

  Future getDetails() async {
    String? url = "dlsatestserver.serveo.net";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');

    final response =
        await http.get(Uri.parse('https://$url/student/home/$username'));
    print('response: ${response.body}');

    final attendancePercentage = await http
        .get(Uri.parse('https://$url/student/attendance/home/$username'));
    print('attendance: ${attendancePercentage.body}');

    final announcements =
        await http.get(Uri.parse('https://$url/announcements'));
    print('announcements: ${announcements.body}');

    return {
      "result": jsonDecode(response.body),
      "attendance": jsonDecode(attendancePercentage.body),
      "announcements": jsonDecode(announcements.body),
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // handle the error case

              return Text('An error occurred: ${snapshot.error}',
                  style: const TextStyle(color: Colors.red));
            }
            if (!snapshot.hasData) {
              // handle the case when data is null, for example, return a loading spinner
              return CircularProgressIndicator();
            }

            final data = snapshot.data as Map<String, dynamic>;
            print("data: $data");

            return SingleChildScrollView(
              child: Container(
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
                    const SizedBox(
                        height: 30), // Add spacing above the containers
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StudentAttendance()));
                          },
                          child: Container(
                            height: 100,
                            width: 120,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF7F2FA),
                              shape: BoxShape.rectangle,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Center(
                                  child: Text(
                                    "${(data["attendance"]["result"]["present"] / data["attendance"]["result"]["total"] * 100).toStringAsFixed(2)} %",
                                    style: TextStyle(
                                      color: Color(0xFF514D4D),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 8,
                                  left: 8,
                                  child: Text(
                                    'Attendance',
                                    style: TextStyle(
                                      color: Color(0xFF514D4D),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                            width:
                                60), // Add more spacing between the containers
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResultView()));
                          },
                          child: Container(
                            height: 100,
                            width: 120,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF7F2FA),
                              shape: BoxShape.rectangle,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Center(
                                  child: Image.asset(
                                    'assets/images/Pass Fail.png', // Replace with the path to your image asset
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                const Positioned(
                                  top: 8,
                                  left: 8,
                                  child: Text(
                                    'Results',
                                    style: TextStyle(
                                      color: Color(0xFF514D4D),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        // Handle container 3 click
                      },
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F2FA),
                          shape: BoxShape.rectangle,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Center(
                                child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  for (var announcement in data["announcements"]
                                      ["result"])
                                    Card(
                                      margin: const EdgeInsets.all(10),
                                      child: ListTile(
                                        leading: const Icon(Icons.campaign,
                                            size: 25),
                                        title: Text(
                                          announcement['announcement'],
                                          style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Text(
                                          'Announced on ${announcement['date'].toString().substring(0, 10)}',
                                          style: const TextStyle(fontSize: 8),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            )),
                            Positioned(
                              top: 8,
                              left: 8,
                              child: Text(
                                'Upcoming Events',
                                style: TextStyle(
                                  color: Color(0xFF514D4D),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ExamView()));
                          },
                          child: Container(
                            height: 100,
                            width: 120,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF7F2FA),
                              shape: BoxShape.rectangle,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Center(
                                  child: Image.asset('assets/images/Exam.png',
                                      width: 50,
                                      height:
                                          50), // Replace with the path to your image asset
                                ),
                                const Positioned(
                                  top: 8,
                                  left: 8,
                                  child: Text(
                                    'Exams',
                                    style: TextStyle(
                                      color: Color(0xFF514D4D),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                            width:
                                60), // Add more spacing between the containers
                        GestureDetector(
                          onTap: () {
                            _callMentor(
                                "tel:${data["result"]["result"][0]["phone"]}");
                          },
                          child: Container(
                            height: 100,
                            width: 120,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF7F2FA),
                              shape: BoxShape.rectangle,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Center(
                                  child: Image.asset('assets/images/Call.png',
                                      width: 50, height: 50),
                                ),
                                const Positioned(
                                  top: 8,
                                  left: 8,
                                  child: Text(
                                    'Contact Mentor',
                                    style: TextStyle(
                                      color: Color(0xFF514D4D),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30)
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void _callMentor(String s) async {
    final phone = 'tel:$s';
    if (await canLaunchUrlString(phone)) {
      await launchUrlString(phone);
    } else {
      throw 'Could not launch $phone';
    }
  }
}
