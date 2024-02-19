import 'package:flutter/material.dart';

class MentorActions extends StatelessWidget {
  const MentorActions({Key? key}) : super(key: key);

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
            "Controls",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Color(0xFF514D4D),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 250,
            width: 330,
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
                          icon: Image.asset("assets/images/Brief.png"),
                          iconSize: 60,
                        ),
                        Text(
                          "Instruction\nfor parents",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset("assets/images/Inscription.png"),
                          iconSize: 60,
                        ),
                        Text(
                          "Letter to Teacher",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset("assets/images/Team.png"),
                          iconSize: 60,
                        ),
                        Text(
                          "Meeting\nTeacher",
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
                          icon: Image.asset("assets/images/Collaborating In Circle.png"),
                          iconSize: 60,
                        ),
                        Text(
                          "Meeting\nParents",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset("assets/images/Todo.png"),
                          iconSize: 60,
                        ),
                        Text(
                          "Support Plan",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset("assets/images/Print.png"),
                          iconSize: 60,
                        ),
                        Text(
                          "Print Report",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}