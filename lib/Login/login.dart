import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
 LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool ishidepasswords=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFF3F3F3)
          
        ),
        
        
        child: Column(children: [
          SizedBox(
            height: 52,
          ),
          Text("Login", style: TextStyle(fontSize: 32)),
          Padding(
            padding: const EdgeInsets.only(left:50.0),
            child: Image.asset('assets/images/tinywow_change_bg_photo_43354930.png'),
          ),

          SizedBox(
            height: 20,
          ),
          Expanded(
            child:Container(
              
             decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
             ),
             
             child: Column(children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,right: 50,left: 50,bottom: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    labelText: "Username",
                  ),
                ),
              ),
              Padding(
                 padding: const EdgeInsets.only(left: 50,right: 50,bottom: 30),
                child: TextFormField(
                  obscureText: ishidepasswords,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    labelText: "Password",
                    suffixIcon: InkWell(
                      onTap: _conertPass,
                      child: Icon(
                        Icons.visibility),
                    )
                    
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(left: 130),
                child: Text("Forgot password?", ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:60,left: 250),
                child: FloatingActionButton.large(
                  backgroundColor: Color(0xFF41BB95),
                  child: Icon(Icons.arrow_forward), onPressed: () {
                  
                },),
              )
             ],
             
             ),
              
              
            ) 
            )
        ]),
       
       
      ),
    );
  }
  void _conertPass() {
    setState(() {
      ishidepasswords =!ishidepasswords;
    });
  }
}