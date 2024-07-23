import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PublishResult extends StatefulWidget {
  final exam_id, examClass, examDivision, totalMarks;

  const PublishResult({
    Key? key,
    required this.exam_id,
    required this.examClass,
    required this.examDivision,
    required this.totalMarks,
  }) : super(key: key);

  @override
  _PublishResultState createState() => _PublishResultState();
}

class _PublishResultState extends State<PublishResult> {
  late Map<String, dynamic> data;
  final Map<String, String> _marks = {};

  Future getStudents() async {
    String? url = "dlsatestserver.serveo.net";

    var link = Uri.parse(
        'http://${url}/teacher/students/${widget.examClass}/${widget.examDivision}');
    var response = await http.get(link);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Publish Result'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade400, Colors.cyan.shade400],
          ),
        ),
        child: FutureBuilder(
          future: getStudents(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              data = snapshot.data as Map<String, dynamic>;
              return Scrollbar(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Enter marks for each student:',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 16),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: data['result'].length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 3,
                            margin: EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListTile(
                              title: Text(
                                data['result'][index]['name'],
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              subtitle: Text(
                                'Roll Number: ${data['result'][index]['roll_no']}',
                                style: TextStyle(color: Colors.grey),
                              ),
                              trailing: SizedBox(
                                width: 120,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Marks/${widget.totalMarks}',
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: 14),
                                  onChanged: (value) {
                                    if (value.isNotEmpty &&
                                        int.parse(value) > widget.totalMarks) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Marks cannot be greater than total marks',
                                          ),
                                        ),
                                      );
                                      value = '';
                                      return;
                                    }
                                    _marks[data['result'][index]['username']
                                            .toString()] =
                                        value.isNotEmpty ? value : '0';
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () async {
                          String? url = "dlsatestserver.serveo.net";

                          var link = Uri.parse(
                              'https://${url}/teacher/exams/${widget.exam_id}/result');
                          var response = await http.post(
                            link,
                            body: jsonEncode({"mark": _marks}),
                            headers: {
                              'Content-Type': 'application/json',
                            },
                          );

                          if (response.statusCode == 200) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Result published successfully'),
                              ),
                            );
                            setState(() {});
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Failed to publish result'),
                              ),
                            );
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
