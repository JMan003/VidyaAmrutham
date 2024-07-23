import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vidyaamrutham/Teacher/controls/Grievances/GrievanceStudent.dart';

class StudentGrievanceSelection extends StatefulWidget {
  const StudentGrievanceSelection({Key? key}) : super(key: key);

  @override
  State<StudentGrievanceSelection> createState() =>
      _StudentGrievanceSelectionState();
}

class _StudentGrievanceSelectionState extends State<StudentGrievanceSelection> {
  Future<Map<String, dynamic>> getClasses() async {
    String? url = "387df06823a93fd406892e1c452f4b74.serveo.net";
    var response = await http.get(Uri.parse('https://$url/teacher/classes'));

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Student Class'),
        backgroundColor: Colors.blue.shade400,
      ),
      body: Container(
        color: Colors.grey.shade200, // Background color for the page
        child: FutureBuilder(
          future: getClasses(),
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
                        "${data['result'][index]['class']} ${data['result'][index]['section']}",
                        style: const TextStyle(
                            fontSize: 18,
                            textBaseline: TextBaseline.alphabetic),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GrievanceStudent(
                              grade: data['result'][index]['class'],
                              section: data['result'][index]['section'],
                            ),
                          ),
                        );
                      },
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
