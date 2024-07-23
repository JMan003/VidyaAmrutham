import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class MeetingTeacher extends StatefulWidget {
  final id;
  const MeetingTeacher({Key? key, required this.id}) : super(key: key);

  @override
  State<MeetingTeacher> createState() => _MeetingTeacherState();
}

class _MeetingTeacherState extends State<MeetingTeacher> {
  Future<Map<String, dynamic>> getMentorDetails(BuildContext context) async {
    String? link = "dlsatestserver.serveo.net";

    var url = Uri.parse('http://$link/mentor/teacher');
    var response = await http.get(url);
    print(response.body);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meeting with Teacher'),
      ),
      body: FutureBuilder(
          future: getMentorDetails(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Text('Error');
            }
            if (snapshot.hasData) {
              return ListView(
                children: <Widget>[
                  ListTile(
                    title: Text("Name: ${snapshot.data['result'][0]['name']}"),
                  ),
                  ListTile(
                    title:
                        Text('Email: ${snapshot.data['result'][0]['email']}'),
                  ),
                  ListTile(
                      title: Text(
                          "Father's Phone: ${snapshot.data['result'][0]['phone']}"),
                      onTap: () {
                        launch('tel:${snapshot.data['result'][0]['phone']}');
                      },
                      trailing: const Icon(
                        Icons.phone,
                        color: Colors.blue,
                      )),
                ],
              );
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
