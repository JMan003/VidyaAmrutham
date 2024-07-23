import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

double? containerHeight,
    containerWidth,
    innerContainerWidth,
    innerContainerHeight,
    controllerContainerWidth,
    controllerContainerHeight;

String name = "",
    admissionNumber = "",
    Class = "",
    section = "",
    rollNumber = "",
    dob = "",
    gender = "",
    fatherName = "",
    motherName = "",
    bloodGroup = "",
    fatherPhone = "",
    motherPhone = "",
    address = "",
    email = "";

class StudentProfile extends StatelessWidget {
  const StudentProfile({Key? key}) : super(key: key);

  Future<Map<String, dynamic>> getStudentData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var username = prefs.getString('username');
    print(username);
    String? url = "387df06823a93fd406892e1c452f4b74.serveo.net";
    print(url);
    var data = await http.get(Uri.parse('https://$url/student/$username'));
    var jsonData = json.decode(data.body);
    print(jsonData);
    name = jsonData['result']['name'];
    admissionNumber = jsonData['result']['admission_no'].toString();
    Class = jsonData['result']['class'].toString();
    section = jsonData['result']['section'];
    rollNumber = jsonData['result']['roll_no'].toString();
    dob = jsonData['result']['dob'].substring(0, 10);
    gender = jsonData['result']['gender'];
    fatherName = jsonData['result']['father_name'];
    motherName = jsonData['result']['mother_name'];
    bloodGroup = jsonData['result']['blood_group'];
    fatherPhone = jsonData['result']['father_phone'].toString();
    motherPhone = jsonData['result']['mother_phone'].toString();
    address = jsonData['result']['address'];
    email = jsonData['result']['email'];

    return jsonData;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    containerHeight = screenHeight * 0.67;
    double screenWidth = MediaQuery.of(context).size.width;
    containerWidth = screenWidth * 0.9;
    innerContainerWidth = screenWidth * 0.9;
    innerContainerHeight = screenHeight * 0.35;

    return FutureBuilder<Map<String, dynamic>>(
      future: getStudentData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return SingleChildScrollView(
          child: Container(
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
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'General Information',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 85, 85, 85),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: innerContainerWidth,
                  height: 220,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF7F2FA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Name :',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 70, 70, 70),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    name,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 70, 70, 70),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 2,
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Admission No :',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 70, 70, 70),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    admissionNumber,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 70, 70, 70),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 2,
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Class:',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 70, 70, 70),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    Class,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 70, 70, 70),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 2,
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Section :',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 70, 70, 70),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    section,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 70, 70, 70),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 2,
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Roll No :',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 70, 70, 70),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    rollNumber,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 70, 70, 70),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 2,
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'DOB :',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 70, 70, 70),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    dob,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 70, 70, 70),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 2,
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Gender :',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 70, 70, 70),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    gender,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 70, 70, 70),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Padding(
                      //     padding: const EdgeInsets.only(
                      //       top: 10,
                      //       left: 20,
                      //     ),
                      //     child: Row(
                      //       children: [
                      //         const Align(
                      //           alignment: Alignment.topLeft,
                      //           child: Text(
                      //             "Address :",
                      //             style: TextStyle(
                      //                 fontSize: 17,
                      //                 fontWeight: FontWeight.bold,
                      //                 color: Color.fromARGB(255, 70, 70, 70)),
                      //           ),
                      //         ),
                      //         Expanded(
                      //             child: Padding(
                      //           padding: const EdgeInsets.only(right: 10),
                      //           child: Align(
                      //             alignment: Alignment.topRight,
                      //             child: Text(
                      //               address.length > 10
                      //                   ? '${address.substring(0, 20)}...'
                      //                   : address,
                      //               style: const TextStyle(
                      //                   fontSize: 17,
                      //                   color: Color.fromARGB(255, 70, 70, 70)),
                      //               overflow: TextOverflow.ellipsis,
                      //             ),
                      //           ),
                      //         )
                      //         ),
                      //       ],
                      //     )
                      //     ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Personal Information',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 85, 85, 85),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: innerContainerWidth,
                  height: 110,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF7F2FA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Father's Name :",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 70, 70, 70),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    fatherName,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 70, 70, 70),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 2,
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Mother's Name :",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 70, 70, 70),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    motherName,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 70, 70, 70),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 2,
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Blood Group :",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 70, 70, 70),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    bloodGroup,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 70, 70, 70),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Contact Information',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 85, 85, 85),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: innerContainerWidth,
                  height: 150,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF7F2FA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Father's No :",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 70, 70, 70),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    fatherPhone,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 70, 70, 70),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 2,
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Mother's No :",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 70, 70, 70),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    motherPhone,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 70, 70, 70),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 2,
                          left: 20,
                        ),
                        child: Row(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Email :",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 70, 70, 70),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    email,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 70, 70, 70),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                            top: 2,
                            left: 20,
                          ),
                          child: Row(
                            children: [
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Address :",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 70, 70, 70)),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    address.length > 10
                                        ? '${address.substring(0, 20)}...'
                                        : address,
                                    style: const TextStyle(
                                        fontSize: 17,
                                        color: Color.fromARGB(255, 70, 70, 70)),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )),
                            ],
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
