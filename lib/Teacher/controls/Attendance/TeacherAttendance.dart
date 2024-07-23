import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TeacherAttendance extends StatefulWidget {
  final String grade, section;

  const TeacherAttendance({
    Key? key,
    required this.grade,
    required this.section,
  }) : super(key: key);

  @override
  State<TeacherAttendance> createState() => _TeacherAttendanceState();
}

class _TeacherAttendanceState extends State<TeacherAttendance> {
  final Map<String, bool> _attendance = {};
  late Map<String, dynamic> data;

  Future<Map<String, dynamic>> getStudents() async {
    String? url = "dlsatestserver.serveo.net";
    var response = await http.get(
      Uri.parse(
          'https://$url/teacher/students/${widget.grade}/${widget.section}'),
    );
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade400, Colors.cyan.shade400],
          ),
        ),
        child: FutureBuilder(
          future: getStudents(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style:
                      const TextStyle(color: Colors.black), // Error text color
                ),
              );
            } else if (snapshot.hasData && snapshot.data['result'] != null) {
              data = snapshot.data as Map<String, dynamic>;
              return Scrollable(
                viewportBuilder: (context, offset) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: data['result'].length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                data['result'][index]['name'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black, // Name text color
                                ),
                              ),
                              subtitle: Text(
                                'Roll Number: ${data['result'][index]['roll_no']}',
                                style: const TextStyle(
                                  color:
                                      Colors.black87, // Roll number text color
                                ),
                              ),
                              trailing: Checkbox(
                                value: _attendance[data['result'][index]
                                            ['username']
                                        .toString()] ??
                                    false,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _attendance[data['result'][index]
                                            ['username']
                                        .toString()] = value ?? false;
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: submitAttendance,
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                                color: Colors.black), // Button text color
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              return const Center(
                child: Text(
                  'No students available.',
                  style: TextStyle(
                      color:
                          Colors.black), // Text color for no students message
                ),
              );
            }
          },
        ),
      ),
    );
  }

  void submitAttendance() async {
    for (int i = 0; i < data['result'].length; i++) {
      if (_attendance[data['result'][i]['username'].toString()] == null) {
        _attendance[data['result'][i]['username'].toString()] = false;
      }
    }
    String? url = "dlsatestserver.serveo.net";
    var response = await http.post(
      Uri.parse('https://$url/teacher/attendance'),
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

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: result['result'] == 'Success'
              ? const Text('Success')
              : const Text('Failed'),
          content: result['result'] == 'Success'
              ? const Text('Attendance Submitted')
              : const Text('Attendance Submission Failed'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
