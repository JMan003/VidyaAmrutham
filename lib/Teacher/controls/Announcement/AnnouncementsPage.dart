import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vidyaamrutham/Teacher/controls/Announcement/AddAnnouncement.dart';

class AnnouncementsPage extends StatefulWidget {
  const AnnouncementsPage({Key? key}) : super(key: key);

  @override
  _AnnouncementsPageState createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {
  Future<Map<String, dynamic>> fetchAnnouncements() async {
    String? url = dotenv.env['SERVER'];

    final response = await http.get(Uri.parse('https://$url/announcements'));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Announcements'),
      ),
      body: FutureBuilder(
        future: fetchAnnouncements(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              Map<String, dynamic> data = snapshot.data as Map<String, dynamic>;
              print(data);
              return Scrollable(viewportBuilder: (context, offset) {
                return Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                      itemCount: data['result'].length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            leading: const Icon(Icons.campaign, size: 50),
                            title: Text(
                              data['result'][index]['announcement'],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Announced on ${data['result'][index]['date'].toString().substring(0, 10)}',
                              style: const TextStyle(fontSize: 15),
                            ),
                            trailing: const Icon(Icons.delete),
                            isThreeLine: true,
                            onTap: () {
                              deleteAnnouncement(data['result'][index]['announcement_id']);
                            },
                          ),
                        );
                      },
                    )),
                    ElevatedButton(
                      onPressed:() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AddAnnouncement()));
                      }, 
                    child: const Text('Add Announcement')
                    ),
                    const SizedBox(height: 40),
                  ],
                );
              });
            } else {
              return const Center(child: Text('No Announcements'));
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
  
  Future<void> deleteAnnouncement(data) async {
    String? url = dotenv.env['SERVER'];

    var link = Uri.parse('https://$url/announcement/delete/$data');
    var res = await http.delete(link);

    if(res.statusCode == 200){
      setState(() {
        
      });
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to delete announcement'),
        ),
      );
    }
  }
}
