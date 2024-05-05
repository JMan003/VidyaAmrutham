import "dart:convert";
import "package:http/http.dart" as http;
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:shared_preferences/shared_preferences.dart";

class Remarks extends StatefulWidget {
  const Remarks({Key? key}) : super(key: key);

  @override
  State<Remarks> createState() => _RemarksState();
}

class _RemarksState extends State<Remarks> {

  Future<Map<String, dynamic>> getRemarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final studentId = prefs.getString('student_id')!;

    String? link = dotenv.env['SERVER'];

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
      body: FutureBuilder(
        future: getRemarks(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Text('Error');
          }
          if (snapshot.hasData) {
            return Scrollable(
              viewportBuilder: (BuildContext context, ViewportOffset position) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data['result'].length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              leading: const Icon(Icons.announcement_outlined, size: 30),
                              title: Text(
                                snapshot.data['result'][index]['grievance'],
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                'Announced on ${snapshot.data['result'][index]['date'].toString().substring(0, 10)}',
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
    );
  }
}