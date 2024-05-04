import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MeetingPage extends StatefulWidget {
  @override
  _MeetingPageState createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  List<Map<String, String>> notesData = [];
  List<Widget> notes = [];

  void addNote(String heading, String note) async {
    setState(() {
      notesData.add({'heading': heading, 'note': note});
      notes.add(
        Container(
          width: MediaQuery.of(context).size.width * 0.95,
          child: Card(
            color: const Color(0xFFF3EDF7),
            margin: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(heading,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(note),
            ),
          ),
        ),
      );
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        'notes', notesData.map((note) => jsonEncode(note)).toList());
  }

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  void loadNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedNotes = prefs.getStringList('notes') ?? [];
    setState(() {
      notesData = savedNotes.map((note) {
        Map<String, dynamic> decodedNote = jsonDecode(note);
        return {
          'heading': decodedNote['heading'].toString(),
          'note': decodedNote['note'].toString(),
        };
      }).toList();
      notes = notesData
          .map((note) => Container(
              width: MediaQuery.of(context).size.width * 0.95,
              child: Card(
                color: const Color(0xFFF3EDF7),
                margin: const EdgeInsets.all(10.0),
                child: ListTile(
                  title: Text(note['heading'] ?? 'No heading',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  subtitle: Text(note['note'] ?? 'No note',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 43, 43, 43))),
                ),
              )))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Meeting Notes',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  ...notes,
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController headingController = TextEditingController();
          TextEditingController notesController = TextEditingController();

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Add Meeting Note'),
                content: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    children: [
                      TextField(
                          controller: headingController,
                          decoration:
                              const InputDecoration(hintText: "Heading"),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      TextFormField(
                        controller: notesController,
                        minLines: 5,
                        maxLines: null,
                        decoration: const InputDecoration(hintText: "Notes"),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text('Save'),
                    onPressed: () {
                      String heading = headingController.text;
                      String notes = notesController.text;
                      addNote(heading, notes);
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: new IconTheme(
          data: new IconThemeData(color: Color.fromARGB(255, 16, 16, 17)),
          child: new Icon(Icons.add),
        ),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
