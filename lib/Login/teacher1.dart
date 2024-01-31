import 'package:flutter/material.dart';

class Teacher1 extends StatelessWidget {
  const Teacher1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         
         leading: Padding(
           padding: const EdgeInsets.only(bottom: 130),
           child: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
         ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 130),
          child: Text("Vidyamrutham"),
        ),
        backgroundColor: Color.fromRGBO(4, 107, 190, 1),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 130),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.notifications)),
          )
        ],
        
        toolbarHeight: 190,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)
          )
        ),
      
      ),
      body: Container(
        width: double.infinity,
       decoration: BoxDecoration(
        color: Colors.white

       ),
       child: Column(children: [
           
       
       ]
       ),
      ),
      
    );
  }
}