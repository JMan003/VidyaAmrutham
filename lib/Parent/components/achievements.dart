import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Achievements extends StatefulWidget {
  const Achievements({Key? key}) : super(key: key);

  @override
  State<Achievements> createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  Future<Map<String, dynamic>> getAchivements() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final studentId = prefs.getString('student_id')!;

    String? link = dotenv.env['SERVER'];

    var url =
        Uri.parse('http://$link/parent/achievements/${studentId}');
    var response = await http.get(url);
    print(response.body);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Achievements'),
      ),
      body: Scrollable(
        viewportBuilder: (BuildContext context, ViewportOffset position) {
          return FutureBuilder(
              future: getAchivements(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return const Text('Error');
                }
                if (snapshot.hasData) {
                  int length = snapshot.data['result'].length;
                  if (length != 0) {
                    return ListView.builder(
                      itemCount: snapshot.data['result'].length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          // Define how the card's content should be clipped
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          // Define the child widget of the card
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Add padding around the row widget
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // Add an image widget to display an image
                                    Image.asset(
                                      'assets/images/Contest.png',
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    // Add some spacing between the image and the text
                                    Container(width: 20),
                                    // Add an expanded widget to take up the remaining horizontal space
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          // Add some spacing between the top of the card and the title
                                          Container(height: 5),
                                          // Add a title widget
                                          Text(
                                            "Position: ${snapshot.data['result'][index]['position']}",
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          // Add some spacing between the title and the subtitle
                                          Container(height: 5),
                                          // Add a subtitle widget
                                          Text(
                                            "Date: ${snapshot.data['result'][index]['date'].toString().substring(0, 10)}",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                          // Add some spacing between the subtitle and the text
                                          Container(height: 10),
                                          // Add a text widget to display some text
                                          Text(
                                            "Description: ${snapshot.data['result'][index]['achievement']}",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text('No Achievements'),
                    );
                  }
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              });
        },
      ),
    );
  }
}
