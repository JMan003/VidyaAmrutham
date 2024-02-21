import 'package:flutter/material.dart';
import 'package:vidyaamrutham/Teacher/TeacherAttendanceSelection.dart';
import 'package:vidyaamrutham/components/Drawer.dart';

class Teacher1 extends StatefulWidget {
  const Teacher1({super.key});

  @override
  State<Teacher1> createState() => _Teacher1State();
}

class _Teacher1State extends State<Teacher1> {
  int _newvalue = 0;
  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: EdgeInsets.only(top: 150),
        child: Container(
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
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Academic details",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 310,
              width: 320.80,
              decoration: const BoxDecoration(
                  color: Color(0xFFF3EDF7),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(blurRadius: 2, blurStyle: BlurStyle.outer)
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TeacherAttendanceSelection()));
                        },
                        icon: Container(
                          child: Image.asset("assets/images/Attendance.png"),
                        ),
                        iconSize: 60,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          child: Image.asset("assets/images/Pass Fail.png"),
                        ),
                        iconSize: 60,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          child: Image.asset("assets/images/Exam.png"),
                        ),
                        iconSize: 60,
                      )
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 9),
                        child: Text(
                          "Attendence",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 19),
                        child: Text(
                          "Result",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 17),
                        child: Text(
                          "Exams",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          child: Image.asset("assets/images/Megaphone.png"),
                        ),
                        iconSize: 60,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          child: Image.asset("assets/images/Page.png"),
                        ),
                        iconSize: 60,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Container(
                            child: Image.asset("assets/images/Flipboard.png"),
                          ),
                          iconSize: 60)
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 9),
                        child: Text(
                          "Announcement",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 19),
                        child: Text(
                          "Assignment",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 17),
                        child: Text(
                          "Notice\nBoard",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          child: Image.asset("assets/images/Yes Or No.png"),
                        ),
                        iconSize: 60,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          child: Image.asset("assets/images/Books.png"),
                        ),
                        iconSize: 60,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          child: Image.asset("assets/images/Classroom.png"),
                        ),
                        iconSize: 60,
                      )
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 9),
                        child: Text(
                          "Grievances",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Subjects",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 11),
                        child: Text(
                          "Students",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _newvalue,
          onTap: (newIndex) {
            setState(() {
              _newvalue = newIndex;
            });
          },
          backgroundColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_sharp,
                color: Colors.black,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.book_sharp,
                  color: Colors.black,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.rectangle,
                  color: Colors.black,
                ),
                label: "")
          ]),
    );
  }
}
