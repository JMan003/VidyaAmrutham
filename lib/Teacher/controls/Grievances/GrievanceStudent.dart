import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vidyaamrutham/Teacher/controls/Grievances/Grievances.dart';
import 'package:vidyaamrutham/Teacher/controls/UpdateStudent/UpdateStudentRegister.dart';
import 'package:vidyaamrutham/Teacher/pages/teacher_home.dart';

class GrievanceStudent extends StatefulWidget {
  final String grade, section;

  GrievanceStudent({Key? key, required this.grade, required this.section})
      : super(key: key);

  @override
  State<GrievanceStudent> createState() => GrievanceStudentState();
}

class GrievanceStudentState extends State<GrievanceStudent> {
  final Map<String, bool> _attendance = {};
  late Map<String, dynamic> data;

  Future<Map<String, dynamic>> getStudents() async {
    String? url = dotenv.env['SERVER'];
    var response = await http.get(Uri.parse(
        'https://$url/teacher/students/${widget.grade}/${widget.section}'));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Student'),
      ),
      body: FutureBuilder(
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
                          return ListTile(
                            title: Text(data['result'][index]['name']),
                            subtitle: Text(
                                'Roll Number: ${data['result'][index]['roll_no']}'),
                                trailing: IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Grievance(
                                          roll_no: data['result'][index]['username'],
                                          mentor_id : data['result'][index]['mentor_id'],
                                        ),
                                      ),
                                    );
                                  },
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
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
