import 'package:flutter/material.dart';

class RoleChoose extends StatelessWidget {
  const RoleChoose({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
             color: Color(0xFFF3F3F3),
        ),
        
        child:Column(children: [
          SizedBox(
            height:52,
          ),
          Text("Choose your role",
              style: TextStyle(fontSize:32 ),),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Image.asset('assets/images/adding new user window3.png'),
          ),
          SizedBox(
            height: 35,
          ),
          Expanded(child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft:Radius.circular(50) ,topRight: Radius.circular(50) )
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  width: 260,
                  height: 53,
                  child:ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.person_add_alt_1_outlined ,color: Color.fromARGB(255, 0, 0, 0),), label: Text("Parent",style: TextStyle( color: Colors.black, fontSize: 20),),
                   style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: Color(0xFFF3EDF7),
                    
                   ),
                   
                  ),
                  ),
              ),
               Padding(
                 padding: const EdgeInsets.only(top: 25),
                 child: SizedBox(
                    width: 260,
                    height: 53,
                    child:ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.person_add_alt_1_outlined ,color: Color.fromARGB(255, 30, 30, 30),), label: Text("Teacher",style: TextStyle( color: Colors.black, fontSize: 20),),
                     style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Color(0xFFF3EDF7),
                      
                     ),
                     
                    ),
                    ),
               ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: SizedBox(
                    width: 260,
                    height: 53,
                    child:ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.person_add_alt_1_outlined ,color: Color.fromARGB(255, 30, 31, 31),), label: Text("Mentor",style: TextStyle( color: Colors.black, fontSize: 20),),
                     style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Color(0xFFF3EDF7),
                      
                     ),
                     
                    ),
                    ),
                ),
                 Padding(
                   padding: const EdgeInsets.only(top: 25)),
                    SizedBox(
                    width: 260,
                    height: 53,
                    child:ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.person_add_alt_1_outlined ,color: Color.fromARGB(255, 16, 16, 16),), label: Text("DLSA",style: TextStyle( color: Colors.black, fontSize: 20),),
                     style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Color(0xFFF3EDF7),
                      
                     ),
                     
                    ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: SizedBox(
                    width: 260,
                    height: 53,
                    child:ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.person_add_alt_1_outlined ,color: Color.fromARGB(255, 7, 7, 7),), label: Text("Student",style: TextStyle( color: Colors.black, fontSize: 20),),
                     style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Color(0xFFF3EDF7),
                      
                     ),
                     
                    ),
                    ),
                  ),
            ],
              
            ),
          ))
        ],
          
        )
    
        
      )
    );
  }
}