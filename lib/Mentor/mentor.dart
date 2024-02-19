import 'package:flutter/material.dart';
import 'package:vidyaamrutham/Mentor/pages/home.dart';
import 'package:vidyaamrutham/Mentor/pages/profile.dart';
import 'package:vidyaamrutham/Mentor/pages/notes.dart';
import 'package:vidyaamrutham/Mentor/pages/actions.dart';

class Mentor extends StatefulWidget {
  const Mentor({Key? key}) : super(key: key);

  @override
  State<Mentor> createState() => _MentorState();
}

class _MentorState extends State<Mentor> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(120), // Set the desired height here
        child: AppBar(
          leading: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
              ),
          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0, right: 110),
                child: Text("Vidyamrutham"),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                        width: 30,
                        height: 30,
                        child: Image.asset("assets/images/mentor.png")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: Text(
                      "Meenakshy J",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,

                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 13, 15, 31),
          actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child:
                IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          )
        ],
          toolbarHeight: 150,
        ),
      ),
      body: <Widget>[
        MentorHome(),
        MentorProfile(),
        MentorNotes(),
        MentorActions(),
      ][currentPageIndex],
      bottomNavigationBar: MyBottomNavigationBar(
        currentPageIndex: currentPageIndex,
        onPageChanged: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
      backgroundColor: const Color.fromARGB(255, 13, 15, 31),
    );
  }
}

class MyBottomNavigationBar extends StatelessWidget {
  final int currentPageIndex;
  final ValueChanged<int> onPageChanged;

  const MyBottomNavigationBar({
    Key? key,
    required this.currentPageIndex,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: Colors.white,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      onDestinationSelected: onPageChanged,
      indicatorColor: Colors.amber,
      surfaceTintColor: Colors.white,
      selectedIndex: currentPageIndex,
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(
            Icons.home,
            color: Colors.black,
          ),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.person,
            color: Colors.black,
          ),
          label: 'Profile',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.book,
            color: Colors.black,
          ),
          label: 'Notes',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.dashboard,
            color: Colors.black,
          ),
          label: 'Actions',
        ),
      ],
    );
  }
}
