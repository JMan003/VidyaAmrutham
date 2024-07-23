import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewExams extends StatefulWidget {
  const ViewExams({Key? key}) : super(key: key);

  @override
  _ViewExamsState createState() => _ViewExamsState();
}

class _ViewExamsState extends State<ViewExams> {
  Future getExams() async {
    String? url = "387df06823a93fd406892e1c452f4b74.serveo.net";

    var link = Uri.parse('http://$url/exams');
    var response = await http.get(link);
    return json.decode(response.body);
  }

  Future deleteExam(String examId) async {
    String? url = "387df06823a93fd406892e1c452f4b74.serveo.net";

    var link = Uri.parse('http://$url/exams/$examId');
    var response = await http.delete(link);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exams'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade400, Colors.cyan.shade400],
          ),
        ),
        child: FutureBuilder(
          future: getExams(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              print(snapshot.data);
              return ListView.builder(
                itemCount: snapshot.data['result'].length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    elevation: 3,
                    child: ListTile(
                      title: Text(
                        "${snapshot.data['result'][index]['name']} - ${snapshot.data['result'][index]['subject']}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "${snapshot.data['result'][index]['date'].toString().substring(0, 10)} :- Class ${snapshot.data['result'][index]['class']} ${snapshot.data['result'][index]['division']}",
                        style: TextStyle(fontSize: 14),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          deleteExam(snapshot.data['result'][index]['exam_id']);
                          setState(() {});
                        },
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
