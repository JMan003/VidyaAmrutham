import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AssignMentorII extends StatefulWidget {
  final String student, username;
  const AssignMentorII(
      {Key? key, required this.student, required this.username})
      : super(key: key);

  @override
  State<AssignMentorII> createState() => _AssignMentorIIState();
}

class _AssignMentorIIState extends State<AssignMentorII> {
  Future<Map<String, dynamic>> getMentorList() async {
    try {
      var url = "387df06823a93fd406892e1c452f4b74.serveo.net";
      var response = await http.get(Uri.parse('https://$url/dlsa/mentors/'));

      if (response.statusCode == 200) {
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
        title: const Text('Assign Mentor'),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: kToolbarHeight + 30),
                  Card(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 20),
                          Center(
                            child: Text(
                              "Select Mentor for ${widget.student}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  FutureBuilder<Map<String, dynamic>>(
                    future: getMentorList(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        var mentors = snapshot.data?['result'] as List<dynamic>;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: mentors.length,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                title: Text(
                                  mentors[index]['mentor_name'],
                                  style: const TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  mentors[index]['email'],
                                  style: const TextStyle(color: Colors.white24),
                                ),
                                trailing: ElevatedButton(
                                  child: const Text('Assign'),
                                  onPressed: () {
                                    var mentor = mentors[index]['username'];
                                    var student = widget.username;
                                    var url =
                                        "387df06823a93fd406892e1c452f4b74.serveo.net";

                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Confirm Mentor'),
                                          content: Text(
                                              'Are you sure you want to choose ${mentors[index]['mentor_name']}?'),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text('Cancel'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            TextButton(
                                              child: const Text('Confirm'),
                                              onPressed: () async {
                                                var response = await http.post(
                                                  Uri.parse(
                                                      'https://$url/dlsa/assign/'),
                                                  body: json.encode({
                                                    'student': student,
                                                    'mentor': mentor,
                                                  }),
                                                  headers: {
                                                    'Content-Type':
                                                        'application/json',
                                                  },
                                                );
                                                if (response.statusCode ==
                                                    200) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                          'Mentor Registered Successfully'),
                                                    ),
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                          'Failed to register mentor'),
                                                    ),
                                                  );
                                                }
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
