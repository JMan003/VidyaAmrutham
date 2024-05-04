import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidyaamrutham/Login/role.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color.fromARGB(255, 0, 0, 0),
                  Color.fromARGB(255, 154, 154, 154),
                ],
              ),
              image: DecorationImage(
                image: AssetImage("assets/images/Teacher student-bro.png"),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Vidyaamrutham",
                style: GoogleFonts.lobster(
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
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
                SizedBox(
                  width: 10,
                ),
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
          // ListTile(
          //   title: const Row(
          //     children: [
          //       Padding(
          //         padding: EdgeInsets.only(left: 8.0),
          //         child: Text('Settings',
          //             style: TextStyle(
          //                 fontSize: 20,
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.bold)),
          //       ),
          //       SizedBox(
          //         width: 10,
          //       ),
          //       Icon(Icons.settings),
          //     ],
          //   ),
          //   onTap: () {
          //   },
          // ),
        ],
      ),
    );
  }
}
