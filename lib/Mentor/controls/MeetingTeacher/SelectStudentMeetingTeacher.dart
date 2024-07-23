import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidyaamrutham/Mentor/controls/MeetingParent/MeetingParent.dart';
import 'package:vidyaamrutham/Mentor/controls/MeetingTeacher/MeetingTeacher.dart';

class SelectTeacher extends StatefulWidget {
  const SelectTeacher({Key? key}) : super(key: key);

  @override
  State<SelectTeacher> createState() => SelectTeacherState();
}

class SelectTeacherState extends State<SelectTeacher> {
  Future<Map<String, dynamic>> getStudents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username') ?? '';
    var link = "dlsatestserver.serveo.net";
    String url = 'http://$link/mentor/student/$username';
    var data = await http.get(
      Uri.parse(url),
    );
    var jsonData = json.decode(data.body);
    var count = jsonData['result'][jsonData['result'].length - 1]['COUNT(id)'];
    jsonData['result'].removeLast();
    return {"count": count, "data": jsonData['result']};
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return FutureBuilder(
        future: getStudents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              var count = data!['count'];
              var students = data['data'];
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Select Student'),
                ),
                body: Align(
                  alignment: Alignment.center,
                  child: ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Container(
                          //height: screenHeight * 0.1,
                          width: screenWidth * 0.6,
                          color: const Color.fromARGB(255, 54, 120, 244),
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: Text(students[index]['name'],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20)),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MeetingTeacher(
                                  id: students[index]['username'].toString()),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              );
            } else {
              return const Text('No data found');
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
