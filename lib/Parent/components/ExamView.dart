import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidyaamrutham/Teacher/controls/PublishResult.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ExamView extends StatefulWidget {
  const ExamView({Key? key}) : super(key: key);

  @override
  _ExamViewState createState() => _ExamViewState();
}

class _ExamViewState extends State<ExamView> {

  Future getExams() async {

    String? url = dotenv.env['SERVER'];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('student_id');

    var link = Uri.parse('http://${url}/parent/exams/$id');
    var response = await http.get(link);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exams'),
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
                    "${snapshot.data['result'][index]['date'].toString().substring(0,10)} :- Class ${snapshot.data['result'][index]['class']} ${snapshot.data['result'][index]['division']}"),
                
              );
            },
          );
        }
      }),
    );
  }
}
