import 'package:flutter/material.dart';
import 'package:vidyaamrutham/Teacher/controls/Announcement/AnnouncementsPage.dart';

class ControlPage extends StatelessWidget {
  const ControlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(top: 50),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(40),
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Card(
                color: const Color(0xFFF3EDF7),
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ListTile(
                          subtitle: GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            childAspectRatio: 1.0,
                            crossAxisSpacing: 50.0,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AnnouncementsPage()));
                                    },
                                    child: SizedBox(
                                      width:
                                          60, // Set this to your desired width
                                      height:
                                          60, // Set this to your desired height
                                      child: Image.asset(
                                          'assets/images/announcement.png'),
                                    ),
                                  ),
                                  const Text(
                                    'Announcements',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    width: 60, // Set this to your desired width
                                    height:
                                        60, // Set this to your desired height
                                    child: Image.asset(
                                        'assets/images/meeting.png'),
                                  ),
                                  const Text(
                                    'Meetings',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    width: 60, // Set this to your desired width
                                    height:
                                        60, // Set this to your desired height
                                    child: Image.asset(
                                        'assets/images/add_mentor.png'),
                                  ),
                                  const Text(
                                    'Add Mentor',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    width: 60, // Set this to your desired width
                                    height:
                                        60, // Set this to your desired height
                                    child: Image.asset(
                                        'assets/images/change_mentor.png'),
                                  ),
                                  const Text(
                                    'Change Mentor',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    width: 60, // Set this to your desired width
                                    height:
                                        60, // Set this to your desired height
                                    child: Image.asset(
                                        'assets/images/assign_mentor.png'),
                                  ),
                                  const Text(
                                    'Assign Mentor',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    width: 60, // Set this to your desired width
                                    height:
                                        60, // Set this to your desired height
                                    child:
                                        Image.asset('assets/images/Print.png'),
                                  ),
                                  const Text(
                                    'Print Report',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
