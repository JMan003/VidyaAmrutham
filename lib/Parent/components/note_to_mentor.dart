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
      ),
      body: Scrollable(
      viewportBuilder: (BuildContext context, ViewportOffset position) {
        return Column(
          children: [
            Expanded(child: Container()),
            Container(
              height: MediaQuery.of(context).size.height * 0.67,
              width: double.infinity,
              decoration: const ShapeDecoration(
                color: Color(0xFFD9D9D9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
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
                      return;

                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ));
  }
  
  Future<void> handleNoteSubmission(String text) async {
    String? url = dotenv.env['SERVER'];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var username = prefs.getString('username');

    final response = await http
        .post(
          Uri.parse('https://$url/parent/note/mentor'), 
        body: {
          'note': text,
          'username': username,
        }
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
