import 'package:flutter/material.dart';
import 'package:vidyaamrutham/Mentor/academic_details/assignments.dart';


class MentorHome extends StatelessWidget {
  const MentorHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
      ),
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Student Details",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Color(0xFF514D4D),
            ),
          ),
          SizedBox(
            height: 200,
            width: 400,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    bottom: 0,
                    child: Container(
                      height: 160,
                      width: 320,
                      decoration: BoxDecoration(
                        color: Color(0xFFF3EDF7),
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        boxShadow: const [
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 40),
                                child: Text(
                                  "Name :",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF514D4D),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 20, top: 40),
                                child: Text(
                                  "John Doe",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF9C9898),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  "Admission No :",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF514D4D),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text(
                                  "8083",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF9C9898),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  "Grade :",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF514D4D),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text(
                                  "IX",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF9C9898),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  "Class :",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF514D4D),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text(
                                  "9-B",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF9C9898),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                Positioned(
                  top: 15,
                  left: 170,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/images/32.png"),
                    iconSize: 60,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Academic Details",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Color(0xFF514D4D),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 210,
            width: 320,
            decoration: BoxDecoration(
              color: Color(0xFFF3EDF7),
              borderRadius: BorderRadius.all(Radius.circular(16)),
              boxShadow: const [
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset("assets/images/Attendance.png"),
                          iconSize: 60,
                        ),
                        Text(
                          'Attendance',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Assignments(),
                              ),
                            );
                          },
                          icon: Image.asset("assets/images/Assignments.png"),
                          iconSize: 60,
                        ),
                        Text(
                          'Assignments',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset("assets/images/Exam.png"),
                          iconSize: 60,
                        ),
                        Text(
                          'Exams',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset("assets/images/Pass Fail.png"),
                          iconSize: 60,
                        ),
                        Text(
                          "Results",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset("assets/images/Prize.png"),
                          iconSize: 60,
                        ),
                        Text(
                          "Achievements",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset("assets/images/YesOrNo.png"),
                          iconSize: 60,
                        ),
                        Text(
                          "Remarks",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
