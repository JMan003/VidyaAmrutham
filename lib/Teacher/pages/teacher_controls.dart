import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";
import "package:url_launcher/url_launcher_string.dart";
import "package:vidyaamrutham/Teacher/controls/ContactMentorSelection.dart";
import "package:vidyaamrutham/Teacher/controls/ContactStudentSelection.dart";
import "package:vidyaamrutham/Teacher/controls/RemoveStudentSelection.dart";
import "package:vidyaamrutham/Teacher/controls/StudentRegistration.dart";
import "package:vidyaamrutham/Teacher/controls/UpdateStudentSelection.dart";

class Teacher2 extends StatelessWidget {

  void _launchDialPadDLSA() async {
    final url = "tel:1234567890";
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 39),
                child: Text(
                  "Controls",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              height: 240,
              width: 323,
              decoration: BoxDecoration(
                  color: const Color(0xFFF3EDF7),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    const BoxShadow(blurRadius: 2, blurStyle: BlurStyle.outer)
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
                                      const ContactStudentSelection()));
                        },
                        icon: Container(
                          child: Image.asset("assets/images/Call.png"),
                        ),
                        iconSize: 60,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ContactMentorSelection()));
                        },
                        icon: Container(
                          child: Image.asset("assets/images/Call.png"),
                        ),
                        iconSize: 60,
                      ),
                      IconButton(
                        onPressed: () {
                          _launchDialPadDLSA();
                        },
                        icon: Container(
                          child: Image.asset("assets/images/Call.png"),
                        ),
                        iconSize: 60,
                      )
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 17),
                        child: Text('Contact\nParent',
                            style:
                                TextStyle(fontSize: 12, color: Colors.black)),
                      ),
                      Text("Contact\nMentor",
                          style: TextStyle(fontSize: 12, color: Colors.black)),
                      Padding(
                        padding: EdgeInsets.only(right: 21),
                        child: Text("Contact\nDLSA",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black)),
                      ),
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
                                      const StudentRegistration()));
                        },
                        icon: Container(
                          child: Image.asset(
                              "assets/images/Student Registration.png"),
                        ),
                        iconSize: 60,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      StudentRemovalSelection()));
                        },
                        icon: Container(
                          child: Image.asset("assets/images/Delete Trash.png"),
                        ),
                        iconSize: 60,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const StudentUpdateSelection()));
                        },
                        icon: Container(
                          child: Image.asset("assets/images/Hand With Pen.png"),
                        ),
                        iconSize: 60,
                      )
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 17),
                        child: Text(
                          '\t\t\tAdd\nStudent',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 13),
                        child: Text("Remove\nStudent",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 21),
                        child: Text("Update\nStudent",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
