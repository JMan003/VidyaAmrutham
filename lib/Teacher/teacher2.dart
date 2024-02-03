import 'package:flutter/material.dart';

class Teacher2 extends StatefulWidget {
  const Teacher2({super.key});

  @override
  State<Teacher2> createState() => _Teacher2State();
}
int _newvalue=0;
class _Teacher2State extends State<Teacher2> {
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
      body: Container(
      
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          SizedBox(
            height: 100,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 39),
                child: Text("Controls",style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(       
               height: 240,
               width: 323,
               decoration: BoxDecoration(
                color: Color(0xFFF3EDF7),
                borderRadius: BorderRadius.circular(16),
                boxShadow:[
                   BoxShadow(blurRadius:2 ,blurStyle: BlurStyle.outer)
                ] 
               ),
               child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  IconButton(onPressed: (){}, icon: Container(
                    child: Image.asset("assets/images/Call.png"),
                  ),iconSize: 60,
                  ),
                  IconButton(onPressed: (){}, icon: Container(
                    child: Image.asset("assets/images/Call.png"),
                  ),iconSize: 60,
                  ),
                  IconButton(onPressed: (){}, icon: Container(
                    child: Image.asset("assets/images/Call.png"),
                  ),iconSize: 60,
                  )
                ],
                  
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween
                 ,children: [
                   
                    Padding(
                      padding: const EdgeInsets.only(left: 17),
                      child: Text('Contact\nParent',style:TextStyle(fontSize: 12)),
                    ),
                    Text("Contact\nMentor",style:TextStyle(fontSize: 12)),
                    Padding(
                      padding: const EdgeInsets.only(right: 21),
                      child: Text("Contact\nDLSA",style:TextStyle(fontSize: 12)),
                    ),
                ],),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  IconButton(onPressed: (){}, icon: Container(
                    child: Image.asset("assets/images/Student Registration.png"),
                  ),iconSize: 60,
                  ),
                  IconButton(onPressed: (){}, icon: Container(
                    child: Image.asset("assets/images/Delete Trash.png"),
                  ),iconSize: 60,
                  ),
                  IconButton(onPressed: (){}, icon: Container(
     
                    child: Image.asset("assets/images/Hand With Pen.png"),
                  ),iconSize: 60,
                  )
                ],
                  
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween
                 ,children: [
                   
                    Padding(
                      padding: const EdgeInsets.only(left: 17),
                      child: Text('\t\t\tAdd\nStudent',style:TextStyle(fontSize: 12) ,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: Text("Remove\nStudent",style:TextStyle(fontSize: 12)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 21),
                      child: Text("Update\nStudent",style:TextStyle(fontSize: 12)),
                    ),
                ],),
               ],
                
               ),
            ),
          )
        ],
          
        ),
      
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _newvalue,
        onTap: (value) {
          setState(() {
            _newvalue = value;
          });
          
        },
        items:[
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
      ] ),
       
      
    );
  }
}