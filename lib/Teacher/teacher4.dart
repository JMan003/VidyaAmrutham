import 'package:flutter/material.dart';

class Teacher4 extends StatefulWidget {
  const Teacher4({super.key});

  @override
  State<Teacher4> createState() => _Teacher4State();
}
int _newvalue = 0;
class _Teacher4State extends State<Teacher4> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                padding: const EdgeInsets.only(bottom: 30, right: 110,top: 12),
                child: Text("Vidyamrutham"),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10,right:10 ),
                child: Container(
                    width: 100,
                    height: 100,
                    child: Image.asset("assets/images/20.png")),
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
      body: Container(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Center(child: Text("Teacher",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w400),)),
          SizedBox(height: 27,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:25.0),
                child: Text("Personal Details" ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
              ),
            ],
          ),
          SizedBox(height: 12,),
          Container(
            height: 170,
            width: 350,
                decoration: BoxDecoration(
                  color: Color(0xFFF3EDF7),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2
                    )
                  ]

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Text("Name:"),
                        Text("teacher")
                    ],),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     
                      children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 23),
                        child: Text("Email:"),
                      ),
                      Text("tec@gmail.com")
                  ],

                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     
                      children: [
                      Text("Phone:"),
                      Text("3455555")
                  ],

                  ),
                 
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     
                      children: [
                      Text("Address:"),
                      Text("24 street")
                  ],

                  ),
                  

                ],

                ),
                
            
          )
        ],
        
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