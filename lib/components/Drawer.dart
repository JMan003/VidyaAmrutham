import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidyaamrutham/Login/role.dart';

class CommonDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 13, 208, 211),
            ),
            child: Text('Vidyaamrutham',
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Logout',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(width: 10,),
                Icon(Icons.logout),
              ],
            ),
            onTap: () {
              SharedPreferences.getInstance().then((prefs) {
                prefs.remove('username');
                prefs.remove('password');
                prefs.remove('role');
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RoleChoose()),
              );
            },
          ),
        ],
      ),
    );
  }
}