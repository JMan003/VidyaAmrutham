import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ParentAttendance extends StatefulWidget {
  const ParentAttendance({Key? key}) : super(key: key);

  @override
  State<ParentAttendance> createState() => _ParentAttendanceState();
}

class _ParentAttendanceState extends State<ParentAttendance> {
  final String studentName = "Student's Name";
  final String studentAdmissionNo = "123456";
  final String studentGrade = "Grade 10";
  final String studentClass = "10 A";

  Future<Map<String, dynamic>> getAttendance() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String studentId = prefs.getString('studentId') ?? '';
    print(studentId);
    String url = 'http://192.168.0.207:3001/parent/attendance/$studentId';
    var response = await http.get(
      Uri.parse(url),
    );
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: getAttendance(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return ListView.builder(
            itemCount: snapshot.data!['attendance'].length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data!['attendance'][index]['date']),
                subtitle: Text(snapshot.data!['attendance'][index]['status']),
              );
            },
          );
        },
        )
    );
  }
}