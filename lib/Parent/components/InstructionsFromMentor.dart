import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InstructionsFromMentor extends StatefulWidget {
  const InstructionsFromMentor({Key? key}) : super(key: key);
  @override
  State<InstructionsFromMentor> createState() => _InstructionsFromMentorState();
}

class _InstructionsFromMentorState extends State<InstructionsFromMentor> {
  Future<Map<String, dynamic>> getInstructions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username') ?? '';

    String? link = "dlsatestserver.serveo.net";

    String url = 'https://$link/parent/instructions/$username';

    var response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch instructions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instructions From Mentor'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue,
                  Colors.cyan,
                  Colors.green,
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: FutureBuilder(
                future: getInstructions(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    var data = snapshot.data?['result'];
                    if (data == null || data.length == 0) {
                      return Center(child: Text('No instructions available'));
                    } else {
                      return Padding(
                          padding: const EdgeInsets.only(
                              top: 60.0), // Adjust padding as needed
                          child: Scrollable(viewportBuilder:
                              (BuildContext context, ViewportOffset position) {
                            return Column(children: [
                              
                                 ListView.builder(
                                  itemCount: data.length,
                                  shrinkWrap:
                                      true, // Use shrinkWrap to make ListView work inside Column/SingleChildScrollView
                                  itemBuilder: (context, index) {
                                    var date = snapshot.data?['result'][index]
                                            ['date']
                                        .toString();
                                    return Card(
                                      margin: const EdgeInsets.all(10),
                                      child: ListTile(
                                        leading: const Icon(
                                          Icons.announcement_outlined,
                                          size: 30,
                                          color: Colors.blue,
                                        ),
                                        title: Text(
                                          'Announced on ${date?[8]}${date?[9]}-${date?[5]}${date?[6]}-${date?[0]}${date?[1]}${date?[2]}${date?[3]}',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        subtitle: Text(
                                          snapshot.data?['result'][index]
                                              ['instruction'],
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              
                            ]);
                          }));
                    }
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
