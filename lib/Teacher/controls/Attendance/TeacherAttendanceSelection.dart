import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidyaamrutham/Teacher/controls/Attendance/TeacherAttendance.dart';

class TeacherAttendanceSelection extends StatefulWidget {
  const TeacherAttendanceSelection({Key? key}) : super(key: key);

  @override
  State<TeacherAttendanceSelection> createState() =>
      _AttendanceSelectionState();
}

class _AttendanceSelectionState extends State<TeacherAttendanceSelection> {
  Future<Map<String, dynamic>> getClasses() async {
    String? url = "dlsatestserver.serveo.net";
    var response = await http.get(Uri.parse('http://$url/teacher/classes'));

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take Attendance'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade400, Colors.cyan.shade400],
          ),
        ),
        child: FutureBuilder<Map<String, dynamic>>(
          future: getClasses(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData &&
                snapshot.data!.containsKey('result')) {
              List<dynamic> data = snapshot.data!['result'];
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TeacherAttendance(
                              grade: data[index]['class'],
                              section: data[index]['section'],
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "${data[index]['class']} ${data[index]['section']}",
                        style: TextStyle(color: Colors.blue),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.all(12)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('No classes available.'),
              );
            }
          },
        ),
      ),
    );
  }
}
