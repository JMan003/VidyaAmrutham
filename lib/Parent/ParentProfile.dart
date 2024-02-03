import 'package:flutter/material.dart';
import 'package:vidyaamrutham/Parent/ParentDashboard.dart';

int _selectedIndex = 1;
double? containerHeight,
    innerContainerWidth,
    innerContainerHeight,
    controllerContainerWidth,
    controllerContainerHeight;

class ParentProfile extends StatefulWidget {
  const ParentProfile({Key? key}) : super(key: key);
  @override
  State<ParentProfile> createState() => ProfileState();
}

class ProfileState extends State<ParentProfile> {
  @override
  Widget build(BuildContext context) {
    
    double screenHeight = MediaQuery.of(context).size.height;
    containerHeight = screenHeight * 0.67;
    double screenWidth = MediaQuery.of(context).size.width;

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
          const SizedBox(
            height: 20,
          ),
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
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(context),
    );
  }
}

// ignore: non_constant_identifier_names
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
              MaterialPageRoute(builder: (context) => const ParentProfile()));
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
