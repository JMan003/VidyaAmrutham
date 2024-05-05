import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidyaamrutham/Mentor/academic_details/assignments.dart';
import 'package:vidyaamrutham/Mentor/academic_details/student_selection.dart';
import 'package:intl/intl.dart';

class MentorHome extends StatelessWidget {
  const MentorHome({Key? key}) : super(key: key);

  Future<Map<String, dynamic>> getMentorData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var username = prefs.getString('username');
    var url = dotenv.env['SERVER'];

    print(url);
    print(username);

    var data =
        await http.get(Uri.parse('http://$url/mentor/student/$username'));
    var jsonData = json.decode(data.body);
    var count = jsonData['result'][jsonData['result'].length - 1]['COUNT(id)'];
    jsonData['result'].removeLast();
    return {"count": count, "data": jsonData['result']};
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder<Map<String, dynamic>>(
      future: getMentorData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            var data = snapshot.data;
            var count = data!['count'];
            var students = data['data'];
            print(students);
            return Scrollable(
              viewportBuilder: (BuildContext context, ViewportOffset position) {
                // Add your widget tree here
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
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Student Details",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF514D4D),
                        ),
                      ),
                      ListView.builder(
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: Text(
                                      "Student Details",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        color: Color(0xFF514D4D),
                                      ),
                                    ),
                                    content: Container(
                                      height: screenHeight * 0.3,
                                      width: screenWidth * 0.8,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          buildDetailRow(
                                              "Name", students[index]['name']),
                                          buildDetailRow(
                                              "Class",
                                              students[index]['class']
                                                  .toString()),
                                          buildDetailRow("Section",
                                              students[index]['section']),
                                          buildDetailRow(
                                              "Roll No",
                                              students[index]['roll_no']
                                                  .toString()),
                                          buildDetailRow(
                                              "DOB",
                                              students[index]['dob'].substring(0, 10).toString()),
                                          buildDetailRow(
                                              "Admission Number",
                                              students[index]['admission_no']
                                                  .toString()),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Close",
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: ListTile(
                              title: Text(students[index]['name'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF514D4D),
                                  )),
                              subtitle: Text(students[index]['class'] +
                                  " - " +
                                  students[index]['section']),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF514D4D),
                              ),
                            ),
                          );
                        },
                        itemCount: students.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Academic Details",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF514D4D),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 210,
                        width: 320,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF3EDF7),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const AttendanceSelection(),
                                          ),
                                        );
                                      },
                                      icon: Image.asset(
                                          "assets/images/Attendance.png"),
                                      iconSize: 60,
                                    ),
                                    const Text(
                                      'Attendance',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Assignments(),
                                          ),
                                        );
                                      },
                                      icon: Image.asset(
                                          "assets/images/Assignments.png"),
                                      iconSize: 60,
                                    ),
                                    const Text(
                                      'Assignments',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon:
                                          Image.asset("assets/images/Exam.png"),
                                      iconSize: 60,
                                    ),
                                    const Text(
                                      'Exams',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                          "assets/images/Pass Fail.png"),
                                      iconSize: 60,
                                    ),
                                    const Text(
                                      "Results",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                          "assets/images/Prize.png"),
                                      iconSize: 60,
                                    ),
                                    const Text(
                                      "Achievements",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                          "assets/images/YesOrNo.png"),
                                      iconSize: 60,
                                    ),
                                    const Text(
                                      "Remarks",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                );
                ; // Replace with your desired widget
              },
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "$label:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(width: 8.0),
          Text(
            value,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
