import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Exams extends StatefulWidget {
  final String id;
  const Exams({Key? key, required this.id}) : super(key: key);

  @override
  _ExamsState createState() => _ExamsState();
}

class _ExamsState extends State<Exams> {
  Future getExams() async {
    String? url = "dlsatestserver.serveo.net";

    var link = Uri.parse('https://$url/mentor/exams/${widget.id}');
    var response = await http.get(link);
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
            colors: [Colors.blue, Colors.cyan, Colors.deepPurple],
          ),
        ),
        child: FutureBuilder(
          future: getExams(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data['result'].length != 0) {
              return ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: snapshot.data['result'].length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Card(
                      color: Colors.white,
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          "${snapshot.data['result'][index]['name']} - ${snapshot.data['result'][index]['subject']}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "${snapshot.data['result'][index]['date'].toString().substring(0, 10)} :- Class ${snapshot.data['result'][index]['class']} ${snapshot.data['result'][index]['division']}",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text(
                  'No data found',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
