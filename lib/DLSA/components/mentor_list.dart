import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MentorList extends StatelessWidget {
  Future<Map<String, dynamic>> getMentorList() async {
    try {
      var url = dotenv.env['SERVER'];
      var response = await http.get(Uri.parse('http://$url/dlsa/mentor/list'));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to fetch Mentor list');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 13, 15, 31),
      appBar: AppBar(
        title: const Text('Mentor List'),
        backgroundColor: Color.fromARGB(255, 13, 15, 31),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: getMentorList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              Map<String, dynamic> data = snapshot.data as Map<String, dynamic>;
              print(data);
              return ListView.builder(
                itemCount: data['result'].length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    //color: Colors.grey[300],
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ListTile(
                        title: Text(data['result'][index]['mentor_name'],
                        //style: TextStyle(color: Colors.black)
                        ),
                        subtitle: Text(data['result'][index]['phone'],
                        //style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                      data['result'][index]['mentor_name']),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Phone Number: ${data['result'][index]['phone']}',
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        'Email: ${data['result'][index]['email']}',
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        'Address: ${data['result'][index]['address']}',
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text('Close'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
