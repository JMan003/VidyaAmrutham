import 'package:flutter/material.dart';
import 'package:vidyaamrutham/Login/role.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.purple],
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    color: Colors.white.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Image.asset('assets/images/icon.png', height: 200, width: 200,),
                          Text(
                            "About Vidyaamrutham",
                            style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Welcome to the 'Vidyaamrutham' project, proudly coordinated by the honourable District Legal Services Authority (DLSA), Thiruvananthapuram. This transformative initiative is dedicated to enhancing the socio-academic lives of students in our community schools. Through the expert guidance and mentorship of our esteemed lawyers, each student receives personalized attention and direction, empowering them to navigate their academic journey and personal development with confidence and clarity. By fostering a supportive and enriching environment, 'Vidyaamrutham' aims to inspire students to reach their full potential and build a brighter future.",
                            style: TextStyle(color: Colors.black, fontSize: 16, fontStyle: FontStyle.italic), textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed:() {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => RoleChoose()));
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text('Continue Login'),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
