import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class MeetingParent extends StatefulWidget {
  final id;
  const MeetingParent({Key? key, required this.id}) : super(key: key);

  @override
  State<MeetingParent> createState() => _MeetingParentState();
}

class _MeetingParentState extends State<MeetingParent> {
  Future<Map<String, dynamic>> getMentorDetails(BuildContext context) async {
    String? link = "387df06823a93fd406892e1c452f4b74.serveo.net";

    var url = Uri.parse('http://$link/student/${widget.id}');
    var response = await http.get(url);
    print(response.body);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meeting with Parent'),
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
                    title: Text(
                        "Father's Name: ${snapshot.data['result']['father_name']}"),
                  ),
                  ListTile(
                    title: Text(
                        "Mother's Name: ${snapshot.data['result']['mother_name']}"),
                  ),
                  ListTile(
                    title: Text('Email: ${snapshot.data['result']['email']}'),
                  ),
                  ListTile(
                      title: Text(
                          "Father's Phone: ${snapshot.data['result']['father_phone']}"),
                      onTap: () {
                        launch(
                            'tel:${snapshot.data['result']['father_phone']}');
                      },
                      trailing: const Icon(
                        Icons.phone,
                        color: Colors.blue,
                      )),
                  ListTile(
                      title: Text(
                          "Mother's Phone: ${snapshot.data['result']['mother_phone']}"),
                      onTap: () {
                        launch(
                            'tel:${snapshot.data['result']['mother_phone']}');
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
