import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NoteToTeacher extends StatefulWidget {
  const NoteToTeacher({Key? key}) : super(key: key);

  @override
  State<NoteToTeacher> createState() => _NoteToTeacherState();
}

class _NoteToTeacherState extends State<NoteToTeacher> {
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note to Teacher'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.cyan],
          ),
        ),
        child: Scrollable(
          viewportBuilder: (BuildContext context, ViewportOffset position) {
            return Column(
              children: [
                Expanded(child: Container()),
                Container(
                  height: MediaQuery.of(context).size.height * 0.67,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          'Note to Teacher',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextField(
                          controller: noteController,
                          maxLines: 10,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter your note here',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (noteController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please enter a note'),
                              ),
                            );
                            return;
                          }
                          handleNoteSubmission(noteController.text);
                        },
                        child: const Text('Submit'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> handleNoteSubmission(String text) async {
    String? url = "dlsatestserver.serveo.net";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var username = prefs.getString('username');

    final response = await http.post(
      Uri.parse('https://$url/parent/note/teacher'),
      body: {
        'note': text,
        'username': username,
      },
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Note submitted successfully'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to submit note'),
        ),
      );
    }
  }
}
