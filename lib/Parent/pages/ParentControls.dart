import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vidyaamrutham/Parent/components/Announcements.dart';
import 'package:vidyaamrutham/Parent/components/ContactMentor.dart';
import 'package:vidyaamrutham/Parent/components/note_to_mentor.dart';
import 'package:vidyaamrutham/Parent/components/note_to_teacher.dart';
import 'package:vidyaamrutham/Parent/pages/ParentDashboard.dart';
import 'package:vidyaamrutham/Parent/pages/ParentNotes.dart';
import 'package:vidyaamrutham/Parent/pages/ParentProfile.dart';
import 'package:vidyaamrutham/components/Drawer.dart';

int _selectedIndex = 3;
double? containerHeight, innerContainerWidth, innerContainerHeight;
final String studentName = "";

class ParentControls extends StatelessWidget {
  const ParentControls({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    containerHeight = screenHeight * 0.67;
    double screenWidth = MediaQuery.of(context).size.width;
    innerContainerWidth = screenWidth * 0.85;
    innerContainerHeight = screenHeight * 0.3;

    return Scaffold(
      body: Column(children: [
        Expanded(child: Container()),
        Container(
            height: containerHeight,
            width: double.infinity,
            decoration: const ShapeDecoration(
              color: Color(0xFFD9D9D9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
            child: Column(
              children: [
                const Align(
                  child: Padding(
                    padding: EdgeInsets.only(top: 70, left: 20),
                    child: Row(
                      children: [
                        Align(
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Parent Controls',
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 85, 85, 85)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Expanded(
                    child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 2.5),
                      children: [
                        _buildGridItem(
                          'Contact DLSA',
                          'assets/images/Ask Question.png',
                          _callDLSA,
                        ),
                        _buildGridItem(
                          'Note to Teacher',
                          'assets/images/Inscription.png',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NoteToTeacher(),
                              ),
                            );
                          },
                        ),
                        _buildGridItem(
                          'Note to Mentor',
                          'assets/images/Inscription.png',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NoteToMentor(),
                              ),
                            );
                          },
                        ),
                        _buildGridItem(
                          'Announcements',
                          'assets/images/Megaphone.png',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AnnouncementsPage(),
                              ),
                            );
                          },
                        ),
                        _buildGridItem(
                          'Meeting Mentor',
                          'assets/images/Meeting Room.png',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ContactMentor(),
                              ),
                            );
                          },
                        ),
                        _buildGridItem(
                          'Complaints',
                          'assets/images/Yes Or No.png',
                          () {
                            // Add the required functionality here
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ]),
    );
  }

  Widget _buildGridItem(String title, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image(
            image: AssetImage(imagePath),
            width: 75,
          ),
          Text(
            title,
            style:
                TextStyle(fontSize: 15, color: Color.fromARGB(255, 70, 70, 70)),
          ),
        ],
      ),
    );
  }

  void _callDLSA() async {
    final phone = 'tel:+919400391522';
    if (await canLaunchUrlString(phone)) {
      await launchUrlString(phone);
    } else {
      throw 'Could not launch $phone';
    }
  }
}
