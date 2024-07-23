import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SubjectsListing extends StatefulWidget {
  const SubjectsListing({super.key});

  @override
  _SubjectsListingState createState() => _SubjectsListingState();
}

class _SubjectsListingState extends State<SubjectsListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Subjects'),
        ),
        body: FutureBuilder(
          future: getSubjects(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                Map<String, dynamic> data =
                    snapshot.data as Map<String, dynamic>;
                return ListView.builder(
                  itemCount: data["result"].length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(data["result"][index]["subject"]),
                        subtitle: Text(data["result"][index]["name"]),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
            // Add a return statement here
            return Container();
          },
        ));
  }

  Future<Map<String, dynamic>> getSubjects() async {
    String? url = "dlsatestserver.serveo.net";

    var response = await http.get(Uri.parse('https://$url/subjects'));
    return jsonDecode(response.body);
  }
}
