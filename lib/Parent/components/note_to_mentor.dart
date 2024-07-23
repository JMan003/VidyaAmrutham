import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NoteToMentor extends StatefulWidget {
  const NoteToMentor({Key? key}) : super(key: key);

  @override
  State<NoteToMentor> createState() => _NoteToMentorState();
}

class _NoteToMentorState extends State<NoteToMentor> {
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note to Mentor'),
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
                          'Note to Mentor',
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
    String? url = "387df06823a93fd406892e1c452f4b74.serveo.net";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var username = prefs.getString('username');
    var studentId = prefs.getString('student_id');
    print("Username: $username");
    print("Student ID: $studentId");

    final response =
        await http.post(Uri.parse('https://$url/parent/note/mentor'), body: {
      'note': text,
      'username': username,
      'student_id': studentId,
    });

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
