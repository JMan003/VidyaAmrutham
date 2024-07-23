import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class PublishExam extends StatefulWidget {
  const PublishExam({Key? key}) : super(key: key);

  @override
  _PublishExamState createState() => _PublishExamState();
}

class _PublishExamState extends State<PublishExam> {
  String? url = "dlsatestserver.serveo.net";
  TextEditingController examName = TextEditingController();
  TextEditingController examDate = TextEditingController();
  TextEditingController examTime = TextEditingController();
  TextEditingController marks = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController examClass = TextEditingController();
  TextEditingController division = TextEditingController();

  final today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publish Exam'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade400, Colors.cyan.shade400],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Exam Name',
                  border: OutlineInputBorder(),
                  hintText: 'Enter the exam name',
                ),
                controller: examName,
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Class',
                  border: OutlineInputBorder(),
                  hintText: 'Enter the class',
                ),
                controller: examClass,
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Division',
                  border: OutlineInputBorder(),
                  hintText: 'Enter class division',
                ),
                controller: division,
              ),
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.dateAndTime,
                  initialDateTime: DateTime(today.year, today.month, today.day,
                      today.hour, today.minute),
                  onDateTimeChanged: (DateTime newDateTime) {
                    examDate.text = newDateTime.toString();
                  },
                  use24hFormat: false,
                  minuteInterval: 1,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Total Marks',
                  border: OutlineInputBorder(),
                  hintText: 'Enter the total marks',
                ),
                controller: marks,
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Subject',
                  border: OutlineInputBorder(),
                  hintText: 'Enter the exam subject',
                ),
                controller: subject,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    var response = await http.post(
                      Uri.parse('https://$url/teacher/publish/exam'),
                      body: {
                        'name': examName.text,
                        'examClass': examClass.text,
                        'division': division.text,
                        'date': examDate.text,
                        'marks': marks.text,
                        'subject': subject.text,
                      },
                    );

                    if (response.statusCode == 200) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Exam Published Successfully'),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Failed to publish exam'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Publish Exam',
                      style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
