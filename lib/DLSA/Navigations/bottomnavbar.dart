import 'package:flutter/material.dart';
import 'package:vidyaamrutham/DLSA/components/dlsaDashboard.dart';
import 'package:vidyaamrutham/Login/login.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    // Add your pages here
    // Example: HomePage(), ProfilePage(), SettingsPage()
    DLSADashboard(),LoginPage()
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
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
        selectedItemColor: Color.fromARGB(255, 235, 143, 57),
    );
  }
}
