import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AddAnnouncement extends StatefulWidget {
  const AddAnnouncement({Key? key}) : super(key: key);

  @override
  _AddAnnouncementState createState() => _AddAnnouncementState();
}

class _AddAnnouncementState extends State<AddAnnouncement> {
  TextEditingController _announcement = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Announcement'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Announcement',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Enter announcement here',
                border: InputBorder.none,
                fillColor: Color.fromARGB(255, 255, 255, 255),
                hintStyle: TextStyle(color: Colors.grey),
              ),
              style: const TextStyle(color: Colors.white),
              controller: _announcement,
              maxLines: 5,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              publishAnnouncement();
            },
            child: const Text('Publish'),
          ),
        ],
      ),
    );
  }

  Future<void> publishAnnouncement() async {
    // Implement the logic to publish the announcement
    String? url = dotenv.env['SERVER'];

    var link = Uri.parse('https://${url}/teacher/announcement');
    var response = await http.post(
      link,
      body: jsonEncode({
        "announcement": _announcement.text,
        "date": DateTime.now().toString().substring(0, 10)
      }),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Announcement published successfully'),
        ),
      );
      setState(() {
        _announcement.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to publish announcement'),
        ),
      );
    }
  }
}
