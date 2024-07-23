import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Assignments extends StatefulWidget {
  const Assignments({super.key});

  @override
  _AssignmentsState createState() => _AssignmentsState();
}

class _AssignmentsState extends State<Assignments> {
  Future listAssignments() async {
    String? url = "dlsatestserver.serveo.net";

    var response = await http.get(Uri.parse('https://$url/assignments'));
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignments'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.cyan, Colors.deepPurple],
          ),
        ),
        child: FutureBuilder(
          future: listAssignments(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data["result"].length,
                itemBuilder: (BuildContext context, int index) {
                  var assignment = snapshot.data["result"][index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Card(
                      color: Colors.white,
                      elevation: 5,
                      child: ListTile(
                        title: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () {},
                          child: Text(
                            "${assignment['title']} - ${assignment['class']} ${assignment['division']}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        subtitle: Text(
                          assignment['description'],
                          style: TextStyle(color: Colors.black),
                        ),
                        trailing: Text(
                          assignment['deadline'].toString().substring(0, 10),
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
