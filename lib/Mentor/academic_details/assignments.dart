import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:vidyaamrutham/Teacher/controls/Assignment/AddAssignment.dart';

class Assignments extends StatefulWidget {
  const Assignments({super.key});

  @override
  _AssignmentsState createState() => _AssignmentsState();
}

class _AssignmentsState extends State<Assignments> {
  Future listAssignments() async {
    String? url = dotenv.env['SERVER'];

    var response = await http.get(Uri.parse('https://$url/assignments'));
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignments'),
      ),
      body: FutureBuilder(
        future: listAssignments(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  for (var assignment in snapshot.data["result"])
                    Card(
                      child: ListTile(
                        title: ElevatedButton(
                          child: Text(
                              "${assignment['title']} - ${assignment['class']} ${assignment['division']}"),
                          onPressed: (){
                            
                          },
                        ),
                        subtitle: Text(assignment['description']),
                        trailing: Text(
                            assignment['deadline'].toString().substring(0, 10)),
                      ),
                    ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
