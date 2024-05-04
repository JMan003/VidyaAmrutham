import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vidyaamrutham/Teacher/controls/ContactStudent.dart';

class ContactStudentSelection extends StatefulWidget {
  const ContactStudentSelection({Key? key}) : super(key: key);
  @override
  State<ContactStudentSelection> createState() => StudentSelection();
}

class StudentSelection extends State<ContactStudentSelection> {
  Future<Map<String, dynamic>> getClasses() async {
    String? url = dotenv.env["SERVER"];
    var response =
        await http.get(Uri.parse('http://$url/teacher/classes'));

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Choose Class'),
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
                                      builder: (context) => ContactStudent(
                                          grade : data['result'][index]['class'],
                                          section : data['result'][index]['section']
                                        )
                                  )
                              );
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
