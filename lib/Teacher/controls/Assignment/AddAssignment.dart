import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddAssignment extends StatefulWidget {
  const AddAssignment({Key? key}) : super(key: key);

  @override
  _AddAssignmentState createState() => _AddAssignmentState();
}

class _AddAssignmentState extends State<AddAssignment> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController divisionController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();
  TextEditingController subjectController = TextEditingController();

  final today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Assignment'),
        ),
        body: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                const SizedBox(height: 30),
                TextFormField(
                  controller: titleController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                    hintText: 'Enter title',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: descriptionController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      labelText: 'Description', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: classController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      labelText: 'Class', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: divisionController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      labelText: 'Division', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: subjectController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      labelText: 'Subject', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.dateAndTime,
                    initialDateTime: DateTime(today.year, today.month, today.day,
                        today.hour, today.minute),
                    onDateTimeChanged: (DateTime newDateTime) {
                      deadlineController.text = newDateTime.toString();
                    },
                    use24hFormat: false,
                    minuteInterval: 1,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    addAssignment();
                  },
                  child: const Text('Add Assignment'),
                ),
              ],
            ),
          ),
        ));
  }

  void addAssignment() async {
    String? url = dotenv.env['SERVER'];
    final prefs = await SharedPreferences.getInstance();
    final teacherId = prefs.getString('username');

    var data = {
      'title': titleController.text,
      'description': descriptionController.text,
      'grade': classController.text,
      'division': divisionController.text,
      'deadline': deadlineController.text,
      'subject': subjectController.text,
      'date': DateTime.now().toString().substring(0, 10),
      'teacher_id': teacherId.toString(),
    };

    var response = await http.post(
      Uri.parse('https://$url/assignment'),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      const ScaffoldMessenger(
          child: SnackBar(content: Text('Assignment added successfully')));
      setState(() {
        titleController.clear();
        descriptionController.clear();
        classController.clear();
        divisionController.clear();
        deadlineController.clear();
        subjectController.clear();
      });
    } else {
      const ScaffoldMessenger(
          child: SnackBar(content: Text('Failed to add assignment')));
    }
  }
}
