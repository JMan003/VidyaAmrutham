import 'package:flutter/material.dart';

class Teacher3 extends StatefulWidget {
  const Teacher3({super.key});

  @override
  State<Teacher3> createState() => _Teacher3State();
}
int _newvalue = 0;
class _Teacher3State extends State<Teacher3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 9),
                child: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
              ),
            ],
          ),
        ),
        title: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 55, right: 110),
                child: Text("Vidyamrutham"),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                        width: 50,
                        height: 50,
                        child: Image.asset("assets/images/20.png")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 10),
                    child: Text("Teacher"),
                  ),
                ],
              )
            ],
          ),
        ),
        backgroundColor: Color(0xFF1A1C29),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 130),
            child:
                IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          )
        ],
        toolbarHeight: 190,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 140),
              child: Text("Personal Notes" ,style: TextStyle(fontSize:26,fontWeight: FontWeight.w300 ),),
            ),
            SizedBox(
              height: 12,
            ),
            Center(
              child: Container(
                width: 322,
                child: TextField(
                  maxLines: 12,           
                  decoration: InputDecoration(
                    hintText: "Enter your notes",
                    hintStyle: TextStyle(color: Colors.grey),
                    fillColor: Color(0xFFF3EDF7),
                    filled: true,
                    
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFFF3EDF7)),
      
                    )
                  ),
                ),
              ),
            )
          ],
            
      
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _newvalue,
          onTap: (newIndex) {
            setState(() {
              _newvalue = newIndex;
            });
          },
          backgroundColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_sharp,
                color: Colors.black,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.book_sharp,
                  color: Colors.black,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.rectangle,
                  color: Colors.black,
                ),
                label: "")
          ]),
    );
  }
}