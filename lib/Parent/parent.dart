import 'package:flutter/material.dart';
import 'package:vidyaamrutham/Parent/pages/ParentControls.dart';
import 'package:vidyaamrutham/Parent/pages/ParentDashboard.dart';
import 'package:vidyaamrutham/Parent/pages/ParentNotes.dart';
import 'package:vidyaamrutham/Parent/pages/ParentProfile.dart';
import 'package:vidyaamrutham/components/Drawer.dart';

String parent_name = "Parent";

class Parent extends StatefulWidget {
  const Parent({Key? key}) : super(key: key);

  @override
  State<Parent> createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  int currentPageIndex = 0;

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
                    child: SizedBox(
                        width: 30,
                        height: 30,
                        child: Image.asset("assets/images/34.png")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: Text(
                      parent_name,
                      style: const TextStyle(
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
      drawer: const CommonDrawer(),
      body: <Widget>[
        const ParentDashboard(),
        const ParentProfile(),
        const ParentNotes(),
        const ParentControls(),
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
