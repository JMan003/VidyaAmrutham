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
    String? url = "387df06823a93fd406892e1c452f4b74.serveo.net";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('student_id');

    var link = Uri.parse('http://$url/parent/exams/$id');
    var response = await http.get(link);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exams'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.cyan],
          ),
        ),
        child: FutureBuilder(
          future: getExams(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error loading exams',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                );
              }
              if (!snapshot.hasData || snapshot.data['result'].isEmpty) {
                return Center(
                  child: Text(
                    'No exams found',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data['result'].length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(
                        "${snapshot.data['result'][index]['name']} - ${snapshot.data['result'][index]['subject']}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        "${snapshot.data['result'][index]['date'].toString().substring(0, 10)} :- Class ${snapshot.data['result'][index]['class']} ${snapshot.data['result'][index]['division']}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
