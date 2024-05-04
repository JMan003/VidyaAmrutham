import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class PublishExam extends StatefulWidget {
  const PublishExam({Key? key}) : super(key: key);

  @override
  _PublishExamState createState() => _PublishExamState();
}

class _PublishExamState extends State<PublishExam> {
  String? url = dotenv.env['SERVER'];
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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
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
                  style: const TextStyle(
                    color: Colors.white
                  ),
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
                      print(examDate.text);
                      print(examTime.text);
                      print(examName.text);
                      print(examClass.text);
                      print(marks.text);
                      print(subject.text);

                      var response = await http.post(
                          Uri.parse('https://$url/teacher/publish/exam'),
                          body: {
                            'name': examName.text,
                            'examClass': examClass.text,
                            'division': division.text,
                            'date': examDate.text,
                            'marks': marks.text,
                            'subject': subject.text,
                          });
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
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: const Text('Publish Exam'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
