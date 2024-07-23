import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vidyaamrutham/Teacher/controls/UpdateStudent/UpdateStudentRegister.dart';
import 'package:vidyaamrutham/Teacher/pages/teacher_home.dart';

class UpdateStudent extends StatefulWidget {
  final String grade, section;

  UpdateStudent({Key? key, required this.grade, required this.section})
      : super(key: key);

  @override
  State<UpdateStudent> createState() => UpdateStudentState();
}

class UpdateStudentState extends State<UpdateStudent> {
  final Map<String, bool> _attendance = {};
  late Map<String, dynamic> data;

  Future<Map<String, dynamic>> getStudents() async {
    String? url = "dlsatestserver.serveo.net";
    var response = await http.get(Uri.parse(
        'https://$url/teacher/students/${widget.grade}/${widget.section}'));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Student',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue, // Customize app bar color
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade50,
              Colors.blue.shade100,
            ],
          ),
        ),
        child: FutureBuilder(
          future: getStudents(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                data = snapshot.data as Map<String, dynamic>;
                print(data);

                return Scrollable(viewportBuilder: (context, offset) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: data['result'].length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 3,
                              margin: EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 16,
                              ),
                              child: ListTile(
                                title: Text(
                                  data['result'][index]['name'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  'Roll Number: ${data['result'][index]['roll_no']}',
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UpdateStudentRegistration(
                                          roll_no: data['result'][index]
                                              ['username'],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                });
              }
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: submitAttendance,
        backgroundColor: Colors.blue,
        child: Icon(Icons.check),
      ),
    );
  }

  void submitAttendance() async {
    for (int i = 0; i < data['result'].length; i++) {
      if (_attendance[data['result'][i]['id'].toString()] == null) {
        _attendance[data['result'][i]['id'].toString()] = false;
      }
    }
    String? url = "dlsatestserver.serveo.net";
    var response = await http.post(
      Uri.parse('http://$url/teacher/attendance'),
      body: json.encode({
        'grade': widget.grade,
        'section': widget.section,
        'attendance': _attendance,
        'date': DateTime.now().toIso8601String(),
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    var result = json.decode(response.body);
    print(result);

    if (result['result'] == "Success") {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Success',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text('Attendance Submitted'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Teacher1()),
                    (route) => false,
                  );
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Failed',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text('Attendance Submission Failed'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Teacher1()),
                    (route) => false,
                  );
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
