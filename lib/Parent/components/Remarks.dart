import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Remarks extends StatefulWidget {
  const Remarks({Key? key}) : super(key: key);

  @override
  State<Remarks> createState() => _RemarksState();
}

class _RemarksState extends State<Remarks> {
  Future<Map<String, dynamic>> getRemarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final studentId = prefs.getString('student_id')!;

    String? link = "dlsatestserver.serveo.net";

    var url = Uri.parse('http://$link/parent/remarks/${studentId}');
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
            colors: [Colors.blue, Colors.cyan],
          ),
        ),
        child: FutureBuilder(
          future: getRemarks(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            if (snapshot.hasData) {
              return Scrollable(
                viewportBuilder:
                    (BuildContext context, ViewportOffset position) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data['result'].length,
                          itemBuilder: (BuildContext context, int index) {
                            var date = snapshot.data?['result'][index]['date'].toString();
                            return Card(
                              margin: const EdgeInsets.all(10),
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
                                  'Announced on ${date?[8]}${date?[9]}-${date?[5]}${date?[6]}-${date?[0]}${date?[1]}${date?[2]}${date?[3]}',
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
