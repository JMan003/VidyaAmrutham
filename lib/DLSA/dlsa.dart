import 'package:flutter/material.dart';
import 'package:vidyaamrutham/DLSA/pages/controls.dart';
import 'package:vidyaamrutham/DLSA/pages/home.dart';
import 'package:vidyaamrutham/DLSA/pages/meeting.dart';
import 'package:vidyaamrutham/DLSA/pages/home.dart';
import 'package:vidyaamrutham/DLSA/pages/meeting.dart';
import 'package:vidyaamrutham/DLSA/pages/controls.dart';
import 'package:vidyaamrutham/components/Drawer.dart';


class DLSA extends StatefulWidget {
  const DLSA({Key? key}) : super(key: key);

  @override
  State<DLSA> createState() => _DLSAState();
}

class _DLSAState extends State<DLSA> {
  int currentPageIndex = 0;

  final List<Widget>_pages = [
    HomePage(),
    MeetingPage(),
    ControlPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(120), // Set the desired height here
        child: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
              );
            },
          ),
          title: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 0, right: 110),
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
                  const Padding(
                    padding: EdgeInsets.only(top: 20, left: 10),
                    child: Text(
                      "DLSA",
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
                  IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
            )
          ],
          toolbarHeight: 150,
        ),
      ),
      drawer: CommonDrawer(),
      body: _pages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Meeting Notes',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Controls',
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 235, 143, 57),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
      ), 
      backgroundColor: const Color.fromARGB(255, 13, 15, 31),
    );
  }
}

