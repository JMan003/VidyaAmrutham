import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class ContactMentor extends StatefulWidget {
  const ContactMentor({Key? key}) : super(key: key);

  @override
  State<ContactMentor> createState() => _ContactMentorState();
}

class _ContactMentorState extends State<ContactMentor> {
  Future<Map<String, dynamic>> getMentorDetails(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('student_id')!;

    String? link = "387df06823a93fd406892e1c452f4b74.serveo.net";

    var url = Uri.parse('http://$link/parent/mentor/$id');
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Mentor'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.blue],
          ),
        ),
        child: FutureBuilder(
          future: getMentorDetails(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error loading data',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                );
              }
              if (snapshot.hasData) {
                return ListView(
                  padding: const EdgeInsets.all(10),
                  children: <Widget>[
                    Card(
                      color: Colors.white.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          'Name: ${snapshot.data['result'][0]['mentor_name']}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.white.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          'Email: ${snapshot.data['result'][0]['email']}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.white.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          'Phone: ${snapshot.data['result'][0]['phone']}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {
                          launch('tel:${snapshot.data['result'][0]['phone']}');
                        },
                        trailing: const Icon(
                          Icons.phone,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Text(
                    'No Mentor Details Available',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                );
              }
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
