import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vidyaamrutham/DLSA/components/AssignMentorII.dart';

class AssignMentor extends StatefulWidget {
  const AssignMentor({Key? key}) : super(key: key);

  @override
  State<AssignMentor> createState() => _AssignMentorState();
}

class _AssignMentorState extends State<AssignMentor> {
  Future<Map<String, dynamic>> getStudentList() async {
    try {
      var url = "387df06823a93fd406892e1c452f4b74.serveo.net";
      var response = await http.get(Uri.parse('https://$url/dlsa/students/'));

      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return json.decode(response.body);
      } else {
        throw Exception('Failed to fetch student list');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assign Mentor'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 21, 202, 234),
                  Color.fromARGB(255, 10, 221, 77),
                ],
              ),
            ),
          ),
          FutureBuilder<Map<String, dynamic>>(
            future: getStudentList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              } else {
                var students = snapshot.data?['result'];
                return SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                          20.0, kToolbarHeight + 20.0, 20.0, 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Colors.blue, // Adjust color as needed
                            child: const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 20),
                                  Text(
                                    "Assign Mentor to Student",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Colors.blue, // Adjust color as needed
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: students.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                    students[index]['name'],
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AssignMentorII(
                                          username: students[index]['username'],
                                          student: students[index]['name'],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
