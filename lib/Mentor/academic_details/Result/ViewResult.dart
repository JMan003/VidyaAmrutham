import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidyaamrutham/Teacher/controls/PublishResult.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ResultView extends StatefulWidget {
  final id;
  const ResultView({Key? key, required this.id}) : super(key: key);

  @override
  _ResultViewState createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  Future getResults() async {
    String? url = "387df06823a93fd406892e1c452f4b74.serveo.net";

    var link = Uri.parse('https://${url}/parent/result/${widget.id}');
    var response = await http.get(link);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
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
          future: getResults(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data['result'].length > 0) {
              return ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: snapshot.data['result'].length,
                itemBuilder: (context, index) {
                  var result = snapshot.data['result'][index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Card(
                      color: Colors.white,
                      elevation: 5,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text(
                            result['subject'][0],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          "${result['name']} - ${result['subject']}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "${result['date'].toString().substring(0, 10)} :- Class ${result['class']} ${result['division']}",
                          style: const TextStyle(color: Colors.black54),
                        ),
                        trailing: Text(
                          "${result['mark']} / ${result['marks']}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
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
