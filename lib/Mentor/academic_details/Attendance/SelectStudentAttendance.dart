import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidyaamrutham/Mentor/academic_details/Attendance/Attendance.dart';

class AttendanceSelection extends StatefulWidget {
  const AttendanceSelection({Key? key}) : super(key: key);

  @override
  State<AttendanceSelection> createState() => _AttendanceSelectionState();
}

class _AttendanceSelectionState extends State<AttendanceSelection> {
  Future<Map<String, dynamic>> getStudents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username') ?? '';
    var link = "387df06823a93fd406892e1c452f4b74.serveo.net";
    String url = 'http://$link/mentor/student/$username';
    var data = await http.get(
      Uri.parse(url),
    );
    var jsonData = json.decode(data.body);
    var count = jsonData['result'][jsonData['result'].length - 1]['COUNT(id)'];
    jsonData['result'].removeLast();
    return {"count": count, "data": jsonData['result']};
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return FutureBuilder(
        future: getStudents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              var count = data!['count'];
              var students = data['data'];
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Select Student'),
                ),
                body: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.blue, Colors.cyan, Colors.deepPurple],
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: ListView.builder(
                      itemCount: students.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: Colors.white,
                          elevation: 5,
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                students[index]['name'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MentorAttendance(
                                      studentId: students[index]['username']
                                          .toString()),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: Text('No data found'),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
