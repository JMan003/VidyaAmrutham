import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vidyaamrutham/Teacher/pages/teacher_home.dart';

class RemoveStudent extends StatefulWidget {
  final String grade, section;

  RemoveStudent({Key? key, required this.grade, required this.section})
      : super(key: key);

  @override
  State<RemoveStudent> createState() => RemoveStudentState();
}

class RemoveStudentState extends State<RemoveStudent> {
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
        title: const Text('Student Removal'),
      ),
      body: FutureBuilder(
        future: getStudents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              data = snapshot.data as Map<String, dynamic>;
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blue, Colors.cyan, Colors.deepPurple],
                  ),
                ),
                child: Scrollbar(
                  child: ListView.builder(
                    itemCount: data['result'].length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white.withOpacity(0.9),
                        elevation: 3,
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          title: Text(
                            data['result'][index]['name'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          subtitle: Text(
                            'Roll Number: ${data['result'][index]['roll_no']}',
                            style: TextStyle(color: Colors.black),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              // Implement your delete logic here
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
