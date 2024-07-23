import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Remarks extends StatefulWidget {
  final String id;
  const Remarks({Key? key, required this.id}) : super(key: key);

  @override
  State<Remarks> createState() => _RemarksState();
}

class _RemarksState extends State<Remarks> {
  Future<Map<String, dynamic>> getRemarks() async {
    String? link = "387df06823a93fd406892e1c452f4b74.serveo.net";

    var url = Uri.parse('http://$link/parent/remarks/${widget.id}');
    var response = await http.get(url);
    print(response.body);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remarks'),
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
          future: getRemarks(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'Error loading remarks',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data['result'].length != 0) {
                return ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: snapshot.data['result'].length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      child: ListTile(
                        leading: const Icon(
                          Icons.announcement_outlined,
                          size: 30,
                          color: Colors.blue,
                        ),
                        title: Text(
                          snapshot.data['result'][index]['grievance'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Announced on ${snapshot.data['result'][index]['date'].toString().substring(0, 10)}',
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text(
                    'No remarks found',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                );
              }
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
