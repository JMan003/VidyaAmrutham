import 'package:flutter/material.dart';

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
        leading: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 9),
                child: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
              ),
            ],
          ),
        ),
        title: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 55, right: 110),
                child: Text("Vidyamrutham"),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                        width: 50,
                        height: 50,
                        child: Image.asset("assets/images/20.png")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 10),
                    child: Text("Teacher"),
                  ),
                ],
              )
            ],
          ),
        ),
        backgroundColor: Color(0xFF1A1C29),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 130),
            child:
                IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          )
        ],
        toolbarHeight: 190,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "Academic details",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 310,
            width: 320.80,
            decoration: BoxDecoration(
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
                      onPressed: () {},
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 9),
                      child: Text(
                        "Attendence",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 19),
                      child: Text(
                        "Result",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 17),
                      child: Text(
                        "Exams",
                        style: TextStyle(fontSize: 12),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 9),
                      child: Text(
                        "Announcement",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 19),
                      child: Text(
                        "Assignment",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 17),
                      child: Text(
                        "Notice\nBoard",
                        style: TextStyle(fontSize: 12),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 9),
                      child: Text(
                        "Grievances",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Subjects",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 11),
                      child: Text(
                        "Students",
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _newvalue,
          onTap: (newIndex) {
            setState(() {
              _newvalue = newIndex;
            });
          },
          backgroundColor: Colors.black,
          items: [
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
