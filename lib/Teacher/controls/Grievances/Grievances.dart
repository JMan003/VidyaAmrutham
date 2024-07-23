import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Grievance extends StatelessWidget {
  final String roll_no;
  final String mentor_id;

  Grievance({
    Key? key,
    required this.roll_no,
    required this.mentor_id,
  }) : super(key: key);

  final TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grievance'),
        backgroundColor: Colors.blue.shade400,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade200, // Background color for the page
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Card(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    maxLength: 1000,
                    maxLines: null,
                    controller: myController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your text',
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                grievanceOfStudent(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade400,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Save',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void grievanceOfStudent(BuildContext context) async {
    String? url = "387df06823a93fd406892e1c452f4b74.serveo.net";

    var data = {
      'mentor_id': mentor_id,
      'grievance': myController.text,
      'id': roll_no,
    };

    var response = await http.post(
      Uri.parse('https://$url/teacher/grievance'),
      body: data,
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Grievance saved successfully'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to save grievance'),
        ),
      );
    }
  }
}
