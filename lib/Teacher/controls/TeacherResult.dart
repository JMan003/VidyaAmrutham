import 'package:flutter/material.dart';
import 'package:vidyaamrutham/Teacher/controls/PublishResult.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TeacherResult extends StatefulWidget {
  const TeacherResult({Key? key}) : super(key: key);

  @override
  _TeacherResultState createState() => _TeacherResultState();
}

class _TeacherResultState extends State<TeacherResult> {

  Future getExams() async {

    String? url = dotenv.env['SERVER'];

    var link = Uri.parse('http://${url}/exams');
    var response = await http.get(link);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
      ),
      body: FutureBuilder(future: getExams(), builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          print(snapshot.data);
          return ListView.builder(
            itemCount: snapshot.data['result'].length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                    "${snapshot.data['result'][index]['name']} - ${snapshot.data['result'][index]['subject']}"),
                subtitle: Text(
                    "${snapshot.data['result'][index]['date'].toString().substring(0, 10)} :- Class ${snapshot.data['result'][index]['class']} ${snapshot.data['result'][index]['division']}"),
                trailing: IconButton(
                  icon: const Icon(Icons.upload_file),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PublishResult(
                          exam_id: snapshot.data['result'][index]['exam_id'],
                          examClass: snapshot.data['result'][index]['class'],
                          examDivision: snapshot.data['result'][index]['division'],
                          totalMarks: snapshot.data['result'][index]['marks'],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        }
      }),
    );
  }
}
