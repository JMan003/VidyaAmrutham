import 'package:flutter/material.dart';
import 'package:vidyaamrutham/Parent/ParentControls.dart';
import 'package:vidyaamrutham/Parent/ParentDashboard.dart';
import 'package:vidyaamrutham/Parent/ParentNotes.dart';
import 'package:vidyaamrutham/components/Drawer.dart';

int _selectedIndex = 1;
double? containerHeight,
    containerWidth,
    innerContainerWidth,
    innerContainerHeight,
    controllerContainerWidth,
    controllerContainerHeight;
String studentName = 'Student Name';
String fatherName = 'Father Name';
String motherName = 'Mother Name';
String fatherMobile = '9876543210';
String motherMobile = '9876543210';
String email = 'parent@email.com';
String address = 'Address';

class ParentProfile extends StatefulWidget {
  const ParentProfile({Key? key}) : super(key: key);
  @override
  State<ParentProfile> createState() => ProfileState();
}

class ProfileState extends State<ParentProfile> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    containerHeight = screenHeight * 0.67;
    double screenWidth = MediaQuery.of(context).size.width;
    containerWidth = screenWidth * 0.9;
    innerContainerWidth = screenWidth * 0.9;
    innerContainerHeight = screenHeight * 0.35;

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
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(child: Container()),
          Container(
            height: containerHeight,
            width: double.infinity,
            decoration: const ShapeDecoration(
              color: Color(0xFFD9D9D9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(63),
                  topRight: Radius.circular(63),
                ),
              ),
            ),
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    studentName,
                    style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              Align(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Row(
                    children: [
                      const Align(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Parent Detials',
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 85, 85, 85)),
                          ),
                        ),
                      ),
                      Align(
                        child: GestureDetector(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
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
                    const Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Name :',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 70, 70, 70)),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    'Student Name',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Color.fromARGB(255, 70, 70, 70)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Father's Name :",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 70, 70, 70)),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    fatherName,
                                    style: const TextStyle(
                                        fontSize: 17,
                                        color: Color.fromARGB(255, 70, 70, 70)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Mother's Name :",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 70, 70, 70)),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    motherName,
                                    style: const TextStyle(
                                        fontSize: 17,
                                        color: Color.fromARGB(255, 70, 70, 70)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Father's Mobile :",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 70, 70, 70)),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    fatherMobile,
                                    style: const TextStyle(
                                        fontSize: 17,
                                        color: Color.fromARGB(255, 70, 70, 70)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Mother's Mobile :",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 70, 70, 70)),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    motherMobile,
                                    style: const TextStyle(
                                        fontSize: 17,
                                        color: Color.fromARGB(255, 70, 70, 70)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Email :",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 70, 70, 70)),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    email,
                                    style: const TextStyle(
                                        fontSize: 17,
                                        color: Color.fromARGB(255, 70, 70, 70)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Address :",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 70, 70, 70)),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    address,
                                    style: const TextStyle(
                                        fontSize: 17,
                                        color: Color.fromARGB(255, 70, 70, 70)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              )
            ]),
          )
        ],
      ),
      bottomNavigationBar: BottomNavBar(context),
    );
  }
}

// ignore: non_constant_identifier_names
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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ParentControls()));
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
        label: 'Meeting Notes',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.dashboard_outlined),
        label: 'Controls',
      ),
    ],
    selectedItemColor: const Color.fromARGB(255, 139, 139, 139),
  );
}
