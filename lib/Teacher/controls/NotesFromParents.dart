import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LetterFromParent extends StatefulWidget {
  const LetterFromParent({Key? key}) : super(key: key);

  @override
  State<LetterFromParent> createState() => _LetterFromParentState();
}

class _LetterFromParentState extends State<LetterFromParent> {

  Future<Map<String, dynamic>> getLetters() async {

    String? link = "dlsatestserver.serveo.net";

    String url = 'https://$link/teacher/letters/';

    var response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch notes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Letter From Parent'),
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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: FutureBuilder(
                future: getLetters(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        for (var item in snapshot.data?['letters'])
                          Card(
                            child: ListTile(
                              title: Text(item['title']),
                              subtitle: Text(item['content']),
                            ),
                          ),
                      ],
                    );
                  }
                },
              )
            ),
          ),
        ],
      ),
    );
  }
}