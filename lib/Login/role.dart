import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidyaamrutham/Login/login.dart';

class RoleChoose extends StatelessWidget {
  const RoleChoose({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFF3F3F3),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 52,
                ),
                const Text(
                  "Choose your role",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child:
                      Image.asset('assets/images/adding new user window3.png'),
                ),
                const SizedBox(
                  height: 35,
                ),
                Expanded(
                    child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: SizedBox(
                          width: 260,
                          height: 53,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              SharedPreferences.getInstance().then((prefs) {
                                prefs.setString('role', 'parent');
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            icon: const Icon(
                              Icons.person_add_alt_1_outlined,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            label: const Text(
                              "Parent",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            style: OutlinedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: const Color(0xFFF3EDF7),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: SizedBox(
                          width: 260,
                          height: 53,
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              SharedPreferences.getInstance().then((prefs) {
                                prefs.setString('role', 'teacher');
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            icon: const Icon(
                              Icons.person_add_alt_1_outlined,
                              color: Color.fromARGB(255, 30, 30, 30),
                            ),
                            label: const Text(
                              "Teacher",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            style: OutlinedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: const Color(0xFFF3EDF7),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: SizedBox(
                          width: 260,
                          height: 53,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              SharedPreferences.getInstance().then((prefs) {
                                prefs.setString('role', 'mentor');
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            icon: const Icon(
                              Icons.person_add_alt_1_outlined,
                              color: Color.fromARGB(255, 30, 31, 31),
                            ),
                            label: const Text(
                              "Mentor",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            style: OutlinedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: const Color(0xFFF3EDF7),
                            ),
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 25)),
                      SizedBox(
                        width: 260,
                        height: 53,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            SharedPreferences.getInstance().then((prefs) {
                              prefs.setString('role', 'dlsa');
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          icon: const Icon(
                            Icons.person_add_alt_1_outlined,
                            color: Color.fromARGB(255, 16, 16, 16),
                          ),
                          label: const Text(
                            "DLSA",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          style: OutlinedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: const Color(0xFFF3EDF7),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: SizedBox(
                          width: 260,
                          height: 53,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              SharedPreferences.getInstance().then((prefs) {
                                prefs.setString('role', 'student');
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            icon: const Icon(
                              Icons.person_add_alt_1_outlined,
                              color: Color.fromARGB(255, 7, 7, 7),
                            ),
                            label: const Text(
                              "Student",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            style: OutlinedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: const Color(0xFFF3EDF7),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            )));
  }
}
