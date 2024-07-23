import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vidyaamrutham/DLSA/components/UpdateMentorEdit.dart';

class UpdateMentor extends StatefulWidget {
  const UpdateMentor({Key? key}) : super(key: key);

  @override
  State<UpdateMentor> createState() => _UpdateMentorState();
}

class _UpdateMentorState extends State<UpdateMentor> {
  Future<Map<String, dynamic>> getMentorList() async {
    try {
      var url = "387df06823a93fd406892e1c452f4b74.serveo.net";
      var response = await http.get(Uri.parse('https://$url/dlsa/mentors/'));

      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return json.decode(response.body);
      } else {
        throw Exception('Failed to fetch mentors list');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Mentor'),
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
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                    ),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: const <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Select Mentor to Update",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      color: Colors.blue, // Adjust color as needed
                    ),
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: FutureBuilder<Map<String, dynamic>>(
                        future: getMentorList(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                'Error: ${snapshot.error}',
                                style: TextStyle(color: Colors.red),
                              ),
                            );
                          } else {
                            var mentors = snapshot.data?['result'];
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: mentors.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                    mentors[index]['mentor_name'],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  trailing: ElevatedButton(
                                    child: const Text('Edit'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              UpdateMentorEdit(
                                            username: mentors[index]
                                                ['username'],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                      color: Colors.blue, // Adjust color as needed
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
