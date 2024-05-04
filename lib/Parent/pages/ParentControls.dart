import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vidyaamrutham/Parent/components/note_to_mentor.dart';
import 'package:vidyaamrutham/Parent/components/note_to_teacher.dart';

int _selectedIndex = 3;
double? containerHeight, innerContainerWidth, innerContainerHeight;
const String studentName = "";
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
                  width: innerContainerWidth,
                  height: innerContainerHeight,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF7F2FA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 3,
                        offset: Offset(0, 1),
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Color(0x4C000000),
                        blurRadius: 2,
                        offset: Offset(0, 1),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 0,
                            ),
                            child: Align(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _callDLSA();
                                    },
                                    child: const Column(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'assets/images/Ask Question.png'),
                                          width: 75,
                                        ),
                                        Text(
                                          'Contact DLSA',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 70, 70, 70)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 30,
                            ),
                            child: Align(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const NoteToTeacher(),
                                        ),
                                      );
                                    },
                                    child: const Column(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'assets/images/Inscription.png'),
                                          width: 75,
                                        ),
                                        Text(
                                          ' Note to\nTeacher',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 70, 70, 70)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 30,
                            ),
                            child: Align(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const NoteToMentor(),
                                        ),
                                      );
                                    },
                                    child: const Column(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'assets/images/Inscription.png'),
                                          width: 75,
                                        ),
                                        Text(
                                          ' Note to\nMentor',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 70, 70, 70)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 0,
                            ),
                            child: Align(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Add the required functionality here
                                    },
                                    child: const Column(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'assets/images/Megaphone.png'),
                                          width: 75,
                                        ),
                                        Text(
                                          'Announcements',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 70, 70, 70)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 30,
                            ),
                            child: Align(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Add the required functionality here
                                    },
                                    child: const Column(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'assets/images/Meeting Room.png'),
                                          width: 75,
                                        ),
                                        Text(
                                          'Meeting\n Mentor',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 70, 70, 70)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 30,
                            ),
                            child: Align(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Add the required functionality here
                                    },
                                    child: const Column(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'assets/images/Yes Or No.png'),
                                          width: 75,
                                        ),
                                        Text(
                                          'Complaints',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 70, 70, 70)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
      ]),
    );
  }

  void _callDLSA() async{
    const phone = 'tel:+919400391522';
    if (await canLaunchUrlString(phone)) {
      await launchUrlString(phone);
    } else {
      throw 'Could not launch $phone';
    }
  }
}