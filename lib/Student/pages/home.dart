import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class StudentHome extends StatelessWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollable(
      viewportBuilder: (BuildContext context, ViewportOffset position) {
        return Container(
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
          ),
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 30), // Add spacing above the containers
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle container 1 click
                    },
                    child: Container(
                      height: 100,
                      width: 120,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F2FA),
                        shape: BoxShape.rectangle,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Center(
                            child: Text(
                              'Text 1',
                              style: TextStyle(
                                color: Color(0xFF514D4D),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            left: 8,
                            child: Text(
                              'Attendance',
                              style: TextStyle(
                                color: Color(0xFF514D4D),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 60), // Add more spacing between the containers
                  GestureDetector(
                    onTap: () {
                      // Handle container 2 click
                    },
                    child: Container(
                      height: 100,
                      width: 120,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F2FA),
                        shape: BoxShape.rectangle,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/images/Pass Fail.png', // Replace with the path to your image asset
                              width: 50,
                              height: 50,
                            ),
                          ),
                          const Positioned(
                            top: 8,
                            left: 8,
                            child: Text(
                              'Results',
                              style: TextStyle(
                                color: Color(0xFF514D4D),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: (
                ) {
                  // Handle container 3 click
                },
                child: Container(
                  height: 120,
                  width: 300,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F2FA),
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Center(
                        child: Text(
                          'Text 2',
                          style: TextStyle(
                            color: Color(0xFF514D4D),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Text(
                          'Upcoming Events',
                          style: TextStyle(
                            color: Color(0xFF514D4D),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle container 4 click
                    },
                    child: Container(
                      height: 100,
                      width: 120,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F2FA),
                        shape: BoxShape.rectangle,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/images/Exam.png',
                              width: 50,
                              height: 50
                            ),                           // Replace with the path to your image asset
                          ),
                          
                          const Positioned(
                            top: 8,
                            left: 8,
                            child: Text(
                              'Exams',
                              style: TextStyle(
                                color: Color(0xFF514D4D),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 60), // Add more spacing between the containers
                  GestureDetector(
                    onTap: () {
                      // Handle container 5 click
                    },
                    child: Container(
                      height: 100,
                      width: 120,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F2FA),
                        shape: BoxShape.rectangle,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/images/Call.png',
                              width: 50,
                              height: 50
                            ),
                          ),
                          const Positioned(
                            top: 8,
                            left: 8,
                            child: Text(
                              'Contact Mentor',
                              style: TextStyle(
                                color: Color(0xFF514D4D),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
