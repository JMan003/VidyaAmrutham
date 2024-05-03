import 'package:flutter/material.dart';
import 'package:vidyaamrutham/Teacher/controls/PublishExam.dart';
import 'package:vidyaamrutham/Teacher/controls/ViewExams.dart';

class TeacherExam extends StatefulWidget {
  const TeacherExam({Key? key}) : super(key: key);

  @override
  _TeacherExamState createState() => _TeacherExamState();
}

class _TeacherExamState extends State<TeacherExam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PublishExam()),
                );
              },
              child: const Text('Publish Exam'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ViewExams()),
                );
              },
              child: const Text('View Exam'),
            ),
          ],
        ),
      ),
    );
  }
}
