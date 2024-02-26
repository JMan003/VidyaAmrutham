import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NoteToMentor extends StatefulWidget {
  const NoteToMentor({Key? key}) : super(key: key);

  @override
  State<NoteToMentor> createState() => _NoteToMentorState();
}

class _NoteToMentorState extends State<NoteToMentor> {
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
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
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
                      maxLines: 10,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your note here',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
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
}
