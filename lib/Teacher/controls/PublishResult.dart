import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class PublishResult extends StatefulWidget {
  final exam_id, examClass, examDivision, totalMarks;

  const PublishResult(
      {Key? key,
      required this.exam_id,
      required this.examClass,
      required this.examDivision, 
      required this.totalMarks})
      : super(key: key);

  @override
  _PublishResultState createState() => _PublishResultState();
}

class _PublishResultState extends State<PublishResult> {
  late Map<String, dynamic> data;
  final Map<String, String> _marks = {};

  Future getStudents() async {
    String? url = dotenv.env['SERVER'];

    var link = Uri.parse(
        'http://$url/teacher/students/${widget.examClass}/${widget.examDivision}');
    var response = await http.get(link);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publish Result'),
      ),
      body: FutureBuilder(
        future: getStudents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            data = snapshot.data as Map<String, dynamic>;
            print(snapshot.data);
            return Scrollable(viewportBuilder: (context, offset) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: data['result'].length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(data['result'][index]['name']),
                          subtitle: Text(
                              'Roll Number: ${data['result'][index]['roll_no']}'),
                          trailing: SizedBox(
                            width: 100, // Adjust this value as needed
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Mark/${widget.totalMarks}',
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              onChanged: (value) {
                                if(int.parse(value) > widget.totalMarks) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Marks cannot be greater than total marks'),
                                    ),
                                  );
                                  value = "";
                                  return;
                                }
                                
                                _marks[data['result'][index]['id'].toString()] =
                                    value;
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      String? url = dotenv.env['SERVER'];

                      print(widget.exam_id);

                      print(_marks);  

                      var link = Uri.parse(
                          'https://$url/teacher/exams/${widget.exam_id}/result');
                      var response = await http.post(
                        link, 
                        body: {"mark": _marks},
                        headers: {"Content-Type": "application/json"},
                      );

                      if(response.statusCode == 200) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Result published successfully'),
                          ),
                        );
                        setState(() {

                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Failed to publish result'),
                          ),
                        );
                      }

                    },
                    child: const Text('Submit'),
                  ),
                  const SizedBox(height: 100,)
                ],
              );
            });
          }
        },
      ),
    );
  }
}
