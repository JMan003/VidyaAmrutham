import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InstructionsFromMentor extends StatefulWidget {
  const InstructionsFromMentor({Key? key}) : super(key: key);

  @override
  State<InstructionsFromMentor> createState() => _InstructionsFromMentorState();
}

class _InstructionsFromMentorState extends State<InstructionsFromMentor> {
  Future<Map<String, dynamic>> getInstructions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username') ?? '';

    String? link = "387df06823a93fd406892e1c452f4b74.serveo.net";

    String url = 'https://$link/parent/instructions/$username';

    var response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch instructions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instructions From Mentor'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue,
                  Colors.cyan,
                  Colors.green,
                ],
              ),
            ),
          ),
          SingleChildScrollView(
              child: FutureBuilder(
            future: getInstructions(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                int length = snapshot.data?['result'].length;
                if (length == 0) {
                  return Center(child: Text('No instructions available'));
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      // Add your code here
                    ],
                  );
                }
              }
            },
          )),
        ],
      ),
    );
  }
}
