import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:vidyaamrutham/Teacher/controls/Announcement/AddAnnouncement.dart';

class AnnouncementsPage extends StatefulWidget {
  const AnnouncementsPage({Key? key}) : super(key: key);

  @override
  _AnnouncementsPageState createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {
  late Future<Map<String, dynamic>> _futureAnnouncements;

  @override
  void initState() {
    super.initState();
    _futureAnnouncements = fetchAnnouncements();
  }

  Future<Map<String, dynamic>> fetchAnnouncements() async {
    String? url = "387df06823a93fd406892e1c452f4b74.serveo.net";

    final response = await http.get(Uri.parse('https://$url/announcements'));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Announcements'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade400, Colors.cyan.shade400],
          ),
        ),
        child: FutureBuilder(
          future: _futureAnnouncements,
          builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData &&
                snapshot.data!['result'].isNotEmpty) {
              Map<String, dynamic> data = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: data['result'].length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 16.0,
                          ),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(16.0),
                              leading: const Icon(Icons.campaign,
                                  size: 36, color: Colors.white),
                              title: Text(
                                data['result'][index]['announcement'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: Text(
                                'Announced on ${data['result'][index]['date'].toString().substring(0, 10)}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              trailing: IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  deleteAnnouncement(
                                      data['result'][index]['announcement_id']);
                                },
                              ),
                              isThreeLine: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddAnnouncement(),
                          ),
                        ).then((value) {
                          if (value == true) {
                            setState(() {
                              _futureAnnouncements = fetchAnnouncements();
                            });
                          }
                        });
                      },
                      child: const Text('Add Announcement'),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'No Announcements',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddAnnouncement(),
                          ),
                        ).then((value) {
                          if (value == true) {
                            setState(() {
                              _futureAnnouncements = fetchAnnouncements();
                            });
                          }
                        });
                      },
                      child: const Text('Add Announcement'),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> deleteAnnouncement(int announcementId) async {
    String? url = "387df06823a93fd406892e1c452f4b74.serveo.net";

    var link = Uri.parse('https://$url/announcement/delete/$announcementId');
    var response = await http.delete(link);

    if (response.statusCode == 200) {
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Announcement deleted successfully'),
        ),
      );
      setState(() {
        _futureAnnouncements = fetchAnnouncements();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to delete announcement'),
        ),
      );
    }
  }
}
