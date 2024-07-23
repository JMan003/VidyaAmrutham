import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vidyaamrutham/Teacher/controls/PublishResult.dart';

class TeacherResult extends StatefulWidget {
  const TeacherResult({Key? key}) : super(key: key);

  @override
  _TeacherResultState createState() => _TeacherResultState();
}

class _TeacherResultState extends State<TeacherResult> {
  Future<List<dynamic>> getExams() async {
    String? url = "387df06823a93fd406892e1c452f4b74.serveo.net";

    var link = Uri.parse('http://$url/exams');
    var response = await http.get(link);
    var data = json.decode(response.body);
    return data['result'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
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
          future: getExams(),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var exam = snapshot.data![index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    elevation: 3,
                    child: ListTile(
                      tileColor: Colors.white,
                      title: Text(
                        "${exam['name']} - ${exam['subject']}",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      subtitle: Text(
                        "${exam['date'].toString().substring(0, 10)} :- Class ${exam['class']} ${exam['division']}",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.upload_file),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PublishResult(
                                exam_id: exam['exam_id'],
                                examClass: exam['class'],
                                examDivision: exam['division'],
                                totalMarks: exam['marks'],
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
              return const Center(
                child: Text('No exams found.'),
              );
            }
          },
        ),
      ),
    );
  }
}
