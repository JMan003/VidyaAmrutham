import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';



class ContactMentor extends StatefulWidget {
  var grade;

  var section;

  ContactMentor({Key? key, required this.grade, required this.section})
      : super(key: key);
  @override
  State<ContactMentor> createState() => MentorContact();
}

class MentorContact extends State<ContactMentor> {
  Future<Map<String, dynamic>> getStudents() async {
    String? url = dotenv.env['SERVER'];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username') ?? '';

    var response = await http.get(Uri.parse(
        'http://${url}/mentor/students/${widget.grade}/${widget.section}'));

    var data = json.decode(response.body);
    print(data);

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Mentor'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
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
                                      ['admission_no']
                                  .toString(),
                              applicationIcon: const Icon(Icons.phone),
                              children: [
                                Text(data['result'][index]['phone'],style: TextStyle(color: Colors.white),),
                                Text(data['result'][index]['mentor_name'],style: TextStyle(color: Colors.white),),
                                ElevatedButton(
                                  onPressed: () {
                                    _callMentor(
                                        "tel:${data['result'][index]['phone']}");
                                  },
                                  child: Center(
                                    child: Text(
                                        'Call ${data['result'][index]['mentor_name']}'),
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

  void _callMentor(String s) async {
    final phone = 'tel:$s';
    if (await canLaunchUrlString(phone)) {
      await launchUrlString(phone);
    } else {
      throw 'Could not launch $phone';
    }
  }
}
