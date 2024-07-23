import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:vidyaamrutham/Teacher/controls/Grievances/Grievances.dart';

class GrievanceStudent extends StatefulWidget {
  final String grade, section;

  GrievanceStudent({Key? key, required this.grade, required this.section})
      : super(key: key);

  @override
  State<GrievanceStudent> createState() => _GrievanceStudentState();
}

class _GrievanceStudentState extends State<GrievanceStudent> {
  late Future<Map<String, dynamic>> _futureStudents;

  @override
  void initState() {
    super.initState();
    _futureStudents = getStudents();
  }

  Future<Map<String, dynamic>> getStudents() async {
    String? url = "387df06823a93fd406892e1c452f4b74.serveo.net";
    var response = await http.get(Uri.parse(
        'https://$url/teacher/students/${widget.grade}/${widget.section}'));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Student'),
        backgroundColor: Colors.blue.shade400,
      ),
      body: Container(
        color: Colors.grey.shade200, // Background color for the page
        child: FutureBuilder(
          future: _futureStudents,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              Map<String, dynamic> data = snapshot.data as Map<String, dynamic>;

              return ListView.builder(
                itemCount: data['result'].length,
                itemBuilder: (context, index) {
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      title: Text(
                        data['result'][index]['name'],
                        style: const TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(
                        'Roll Number: ${data['result'][index]['roll_no']}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Grievance(
                                roll_no: data['result'][index]['username'],
                                mentor_id: data['result'][index]['mentor_id'],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }
}
