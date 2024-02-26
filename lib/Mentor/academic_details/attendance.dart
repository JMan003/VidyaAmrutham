import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MentorAttendance extends StatefulWidget {
  String studentId;
  MentorAttendance({Key? key, required this.studentId}) : super(key: key);

  @override
  State<MentorAttendance> createState() => _MentorAttendanceState();
}

class _MentorAttendanceState extends State<MentorAttendance> {
  // final String studentName = "Student's Name";
  // final String studentAdmissionNo = "123456";
  // final String studentGrade = "Grade 10";
  // final String studentClass = "10 A";
  String studentId = '';

  @override
  void initState() {
    super.initState();
    studentId = widget.studentId;
  }

  Future<Map<String, dynamic>> getAttendance() async {
    print("Student ID: $studentId");
    var link = dotenv.env['SERVER'];
    String url = 'http://$link/mentor/attendance/$studentId';
    var response = await http.get(
      Uri.parse(url),
    );
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Attendance'),
        ),
        body: FutureBuilder<Map<String, dynamic>>(
          future: getAttendance(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                Map<String, dynamic> data = snapshot.data!;
                print(data);
                return Column(
                  children: [
                    Scrollable(
                      viewportBuilder:
                          (BuildContext context, ViewportOffset position) {
                        return Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.center,
                              child: DataTable(
                                columns: const <DataColumn>[
                                  DataColumn(
                                    label: Text(
                                      'Date',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Status',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                                rows: List<DataRow>.generate(
                                  data['result'].length,
                                  (index) => DataRow(
                                    cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          data['result'][index]['date']
                                              .toString()
                                              .substring(0, 10),
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          data['result'][index]['status'],
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  ],
                );
              } else {
                return const Text('No data');
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
