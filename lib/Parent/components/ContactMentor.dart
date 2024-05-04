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

    String? link = dotenv.env['SERVER'];

    var url = Uri.parse('http://$link/parent/mentor/${id}');
    var response = await http.get(url);
    print(response.body);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Mentor'),
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
                    title: Text('Name: ${snapshot.data['result'][0]['name']}'),
                  ),
                  ListTile(
                    title: Text('Email: ${snapshot.data['result'][0]['email']}'),
                  ),
                  ListTile(
                    title: Text('Phone: ${snapshot.data['result'][0]['phone']}'),
                    onTap: () {
                      launch('tel:${snapshot.data['result'][0]['phone']}');
                    },
                    trailing: const Icon(
                      Icons.phone,
                      color: Colors.blue,
                      
                    )
                  ),
                    
                ],
              );
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
