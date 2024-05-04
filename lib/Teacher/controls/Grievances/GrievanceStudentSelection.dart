import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:vidyaamrutham/Teacher/controls/Grievances/GrievanceStudent.dart';
import 'package:vidyaamrutham/Teacher/controls/UpdateStudent/UpdateStudent.dart';
import 'package:vidyaamrutham/Teacher/pages/teacher_home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class StudentGrievanceSelection extends StatefulWidget {
  const StudentGrievanceSelection({Key? key}) : super(key: key);
  @override
  State<StudentGrievanceSelection> createState() => GrievanceStudentSelection();
}

class GrievanceStudentSelection extends State<StudentGrievanceSelection> {
  Future<Map<String, dynamic>> getClasses() async {
    String? url = dotenv.env['SERVER'];
    var response = await http.get(Uri.parse('https://$url/teacher/classes'));

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Select Student Class'),
        ),
        body: FutureBuilder(
            future: getClasses(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  Map<String, dynamic> data =
                      snapshot.data as Map<String, dynamic>;
                  print(data);
                  return ListView.builder(
                      itemCount: data['result'].length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: ElevatedButton(
                            // ignore: prefer_interpolation_to_compose_strings
                            child: Text("${data['result'][index]['class']} " +
                                data['result'][index]['section']),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GrievanceStudent(
                                          grade: data['result'][index]['class'],
                                          section: data['result'][index]
                                              ['section'])));
                            },
                          ),
                        );
                      });
                }
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
