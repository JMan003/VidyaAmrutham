import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidyaamrutham/Login/role.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "Vidyaamrutham",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            accountEmail: Text("Welcome!"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "V",
                style: TextStyle(fontSize: 40.0, color: Colors.blue),
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.cyan,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.black),
            title: Text('Logout',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            onTap: () {
              SharedPreferences.getInstance().then((prefs) {
                prefs.remove('username');
                prefs.remove('password');
                prefs.remove('role');
              });
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const RoleChoose()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.black),
            title: Text('Settings',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            onTap: () {
              // Navigate to settings page or perform actions
            },
          ),
        ],
      ),
    );
  }
}
