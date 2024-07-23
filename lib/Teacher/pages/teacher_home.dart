import 'package:flutter/material.dart';
import 'package:vidyaamrutham/DLSA/components/student_list.dart';
import 'package:vidyaamrutham/Teacher/controls/Announcement/AnnouncementsPage.dart';
import 'package:vidyaamrutham/Teacher/controls/Assignment/AssignmentsView.dart';
import 'package:vidyaamrutham/Teacher/controls/Grievances/GrievanceStudentSelection.dart';
import 'package:vidyaamrutham/Teacher/controls/SubjectsListing.dart';
import 'package:vidyaamrutham/Teacher/controls/Attendance/TeacherAttendanceSelection.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vidyaamrutham/Teacher/controls/TeacherExam.dart';
import 'package:vidyaamrutham/Teacher/controls/TeacherResult.dart';

class Teacher1 extends StatelessWidget {
  String? url = "387df06823a93fd406892e1c452f4b74.serveo.net";

  Teacher1({super.key});

  @override
  Widget build(BuildContext context) {
    print(url);

    return Padding(
      padding: const EdgeInsets.only(top: 80),
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TeacherResult()));
                      },
                      icon: Container(
                        child: Image.asset("assets/images/Pass Fail.png"),
                      ),
                      iconSize: 60,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TeacherExam()));
                      },
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AnnouncementsPage()));
                      },
                      icon: Container(
                        child: Image.asset("assets/images/Megaphone.png"),
                      ),
                      iconSize: 60,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AssignmentsView()));
                      },
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    StudentGrievanceSelection()));
                      },
                      icon: Container(
                        child: Image.asset("assets/images/Yes Or No.png"),
                      ),
                      iconSize: 60,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SubjectsListing()));
                      },
                      icon: Container(
                        child: Image.asset("assets/images/Books.png"),
                      ),
                      iconSize: 60,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StudentList()));
                      },
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
    );
  }
}
