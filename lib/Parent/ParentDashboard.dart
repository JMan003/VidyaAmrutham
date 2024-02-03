import 'package:flutter/material.dart';
import 'package:vidyaamrutham/Parent/ParentProfile.dart';

double? containerHeight,
    innerContainerWidth,
    innerContainerHeight,
    controllerContainerWidth,
    controllerContainerHeight;
int _selectedIndex = 0;

class ParentDashboard extends StatelessWidget {
  final String studentName = "Student's Name";
  final String studentAdmissionNo = "123456";
  final String studentGrade = "Grade 10";
  final String studentClass = "10 A";

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    containerHeight = screenHeight * 0.67;
    double screenWidth = MediaQuery.of(context).size.width;
    innerContainerWidth = screenWidth * 0.75;
    innerContainerHeight = screenHeight * 0.2;
    controllerContainerWidth = screenWidth * 0.85;
    controllerContainerHeight = screenHeight * 0.28;

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
      ),
      body: Column(
        children: [
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
                  topLeft: Radius.circular(63),
                  topRight: Radius.circular(63),
                ),
              ),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    left: 50,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Student Details',
                      style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 70, 70, 70)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 50,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: innerContainerWidth,
                      height: innerContainerHeight,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F2FA),
                        borderRadius: BorderRadius.circular(20),
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
                                          color:
                                              Color.fromARGB(255, 70, 70, 70)),
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
                                              color: Color.fromARGB(
                                                  255, 70, 70, 70)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 20,
                              ),
                              child: Row(
                                children: [
                                  const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Admission No. :',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 70, 70, 70)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          studentAdmissionNo,
                                          style: const TextStyle(
                                              fontSize: 17,
                                              color: Color.fromARGB(
                                                  255, 70, 70, 70)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 20,
                              ),
                              child: Row(
                                children: [
                                  const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Student Grade :',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 70, 70, 70)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          studentGrade,
                                          style: const TextStyle(
                                              fontSize: 17,
                                              color: Color.fromARGB(
                                                  255, 70, 70, 70)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 20,
                              ),
                              child: Row(
                                children: [
                                  const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Class :',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 70, 70, 70)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          studentClass,
                                          style: const TextStyle(
                                              fontSize: 17,
                                              color: Color.fromARGB(
                                                  255, 70, 70, 70)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 40, left: 50),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Academic Details',
                      style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 70, 70, 70)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 30,
                  ),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: controllerContainerWidth,
                        height: controllerContainerHeight,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F2FA),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:  Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                    left: 20,
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
                                                    'assets/images/Attendance.png'),
                                                width: 75,
                                              ),
                                              Text(
                                                'Attendance',
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
                                    left: 43,
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
                                                    'assets/images/Pass Fail.png'),
                                                width: 75,
                                              ),
                                              Text(
                                                'Results',
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
                                    left: 43,
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
                                                    'assets/images/Exam.png'),
                                                width: 75,
                                              ),
                                              Text(
                                                'Exams',
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
                                                    'assets/images/Prize.png'),
                                                width: 75,
                                              ),
                                              Text(
                                                'Achivements',
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
                                                'Remarks',
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
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
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
              MaterialPageRoute(builder: (context) => ParentProfile()));
          break;
        case 2:
          Navigator.pushNamed(context, '/meetingNotes');
          break;
        case 3:
          Navigator.pushNamed(context, '/controls');
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
