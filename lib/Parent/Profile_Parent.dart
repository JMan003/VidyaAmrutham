import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(8),
          title: const Text('Vidyamrutham'),
          titleTextStyle: TextStyle(color: Color.fromARGB(255, 247, 247, 247)),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications),
              color: Color.fromARGB(255, 247, 247, 247),
              onPressed: () {},
            ),
          ],
          leading: IconButton(
              onPressed: () {},
              icon: IconButton(
                icon: const Icon(Icons.menu),
                color: Color.fromARGB(255, 247, 247, 247),
                onPressed: () {},
              )),
        ),
        backgroundColor: Color.fromARGB(255, 2, 23, 45),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Color.fromRGBO(0, 0, 0, 0.855),
              ),
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.855),
              label: ("")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Color.fromRGBO(0, 0, 0, 0.855),
              ),
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.855),
              label: ("")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Color.fromRGBO(0, 0, 0, 0.855),
              ),
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.855),
              label: ("")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.face_2_rounded,
                color: Color.fromRGBO(0, 0, 0, 0.855),
              ),
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.855),
              label: ("")),
        ]),
        body: Container(
          child: Column(children: [
            SizedBox(
              height: 77,
              child: Row(children: const [
                Icon(
                  Icons.man,
                  color: Color.fromRGBO(255, 255, 255, 0.855),
                  size: 60,
                ),
                Text('Parent Name :'),
              ]),
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                child: Container(
                  color: Color.fromARGB(255, 246, 246, 246),
                  height: 546,
                ),
              ),
            )
          ]),
        ));
  }
}
