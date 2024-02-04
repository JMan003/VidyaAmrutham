import 'package:flutter/material.dart';
import 'package:vidyaamrutham/Parent/ParentDashboard.dart';
import 'package:vidyaamrutham/Parent/ParentNotes.dart';
import 'package:vidyaamrutham/Parent/ParentProfile.dart';
import 'package:vidyaamrutham/components/Drawer.dart';

int _selectedIndex = 3;
double? containerHeight, innerContainerWidth, innerContainerHeight;

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
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Text('Vidyaamrutham'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Add the required functionality here
            },
          ),
        ],
      ),
      drawer: CommonDrawer(),
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.only(top: 50, left: 50),
            child: Row(
              children: [
                const Image(
                  image: AssetImage('assets/images/34.png'),
                  width: 60,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  studentName,
                  style: const TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )
              ],
            )),
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
                                      // Add the required functionality here
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
                                      // Add the required functionality here
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
                                      // Add the required functionality here
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
      bottomNavigationBar: BottomNavBar(context),
    );
  }
}

Widget BottomNavBar(context) {
  return BottomNavigationBar(
    currentIndex: _selectedIndex,
    onTap: (index) {
      switch (index) {
        case 0:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ParentDashboard()));
          break;
        case 1:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ParentProfile()));
          break;
        case 2:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ParentNotes()));
          break;
        case 3:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ParentControls()));
          break;
      }
    },
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.book),
        label: 'Notes',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.dashboard_outlined),
        label: 'Controls',
      ),
    ],
    selectedItemColor: const Color.fromARGB(255, 139, 139, 139),
  );
}
