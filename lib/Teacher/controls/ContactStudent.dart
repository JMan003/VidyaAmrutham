import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactStudent extends StatefulWidget {
  final String grade;
  final String section;
  const ContactStudent({Key? key, required this.grade, required this.section})
      : super(key: key);
  @override
  State<ContactStudent> createState() => _ContactStudentState();
}

class _ContactStudentState extends State<ContactStudent> {
  getStudents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username') ?? '';

    var response = await http.get(Uri.parse(
        'http://192.168.1.9:3001/teacher/student/${widget.grade}/${widget.section}'));

    print(response.body);

    var data = json.decode(response.body);
    print(data);

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Student'),
      ),
      body: FutureBuilder(
          future: getStudents(),
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
                          child: Text("${data['result'][index]['name']}"),
                          onPressed: () {
                            showAboutDialog(
                              context: context,
                              applicationName: data['result'][index]['name'],
                              applicationVersion: data['result'][index]
                                  ['phone'],
                              applicationIcon: const Icon(Icons.phone),
                              children: [
                                Text("Grade: ${widget.grade}"),
                                Text("Section: ${widget.section}"),
                                ElevatedButton(
                                  onPressed: () => _callStudent(
                                      data['result'][index]['father_phone']),
                                  child: Column(
                                    children:  [
                                      Text("Call Father"),
                                      Text(data['result'][index]['father_name']),
                                    ]
                                  ),
                                ),
                                ElevatedButton(
                                    onPressed: () => _callStudent(
                                        data['result'][index]['mother_phone']),
                                    child: Column(
                                    children:  [
                                      Text("Call Mother"),
                                      Text(data['result'][index]['mother_name']),
                                    ]
                                  ),
                                ),
                              ],
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
          }),
    );
  }

  void _callStudent(data) async {
    final phone = 'tel:$data';
    if (await canLaunchUrlString(phone)) {
      await launchUrlString(phone);
    } else {
      throw 'Could not launch $phone';
    }
  }
}
