import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:vidyaamrutham/Mentor/pages/profile.dart';

class UpdateStudentRegistration extends StatefulWidget {
  final roll_no;

  const UpdateStudentRegistration({
    Key? key,
    required this.roll_no,
  }) : super(key: key);

  @override
  State<UpdateStudentRegistration> createState() =>
      _UpdateStudentRegistrationState();
}

class _UpdateStudentRegistrationState extends State<UpdateStudentRegistration> {
  String parentUsername = "",
      name = "",
      sclass = "",
      div = "",
      roll = "",
      address = "",
      dob = "",
      bloodGroup = "",
      gender = "",
      father = "",
      mother = "",
      email = "",
      fNumber = "",
      mNumber = "",
      admission = "";

  final today = DateTime.now();

  Future<Map<String, dynamic>> getStudentDetails() async {
    String? url = dotenv.env['SERVER'];
    var response = await http
        .get(Uri.parse('https://$url/teacher/update/${widget.roll_no}'));

    parentUsername = jsonDecode(response.body)['result']['username'].toString();
    name = jsonDecode(response.body)['result']['name'].toString();
    sclass = jsonDecode(response.body)['result']['class'].toString();
    div = jsonDecode(response.body)['result']['section'].toString();
    address = jsonDecode(response.body)['result']['address'].toString();
    dob = jsonDecode(response.body)['result']['dob'].toString();
    bloodGroup = jsonDecode(response.body)['result']['blood_group'].toString();
    gender = jsonDecode(response.body)['result']['gender'].toString();
    father = jsonDecode(response.body)['result']['father_name'].toString();
    mother = jsonDecode(response.body)['result']['mother_name'].toString();
    email = jsonDecode(response.body)['result']['email'].toString();
    fNumber = jsonDecode(response.body)['result']['father_phone'].toString();
    mNumber = jsonDecode(response.body)['result']['mother_phone'].toString();
    roll = jsonDecode(response.body)['result']['roll_no'].toString();
    admission = jsonDecode(response.body)['result']['admission_no'].toString();

    dobController = TextEditingController(text: dob);
    nameController = TextEditingController(text: name);
    classController = TextEditingController(text: sclass);
    divisionController = TextEditingController(text: div);
    rollNumberController = TextEditingController(text: roll);
    addressController = TextEditingController(text: address);
    bloodGroupController = TextEditingController(text: bloodGroup);
    genderController = TextEditingController(text: gender);
    fatherController = TextEditingController(text: father);
    motherController = TextEditingController(text: mother);
    fNumberController = TextEditingController(text: fNumber);
    mNumberController = TextEditingController(text: mNumber);
    emailController = TextEditingController(text: email);
    admissionNumberController = TextEditingController(text: admission);

    return jsonDecode(response.body);
  }

  late TextEditingController dobController;
  late TextEditingController nameController;
  late TextEditingController classController;
  late TextEditingController divisionController;
  late TextEditingController rollNumberController;
  late TextEditingController addressController;
  late TextEditingController bloodGroupController;
  late TextEditingController genderController;
  late TextEditingController admissionNumberController;
  late TextEditingController fatherController;
  late TextEditingController motherController;
  late TextEditingController fNumberController;
  late TextEditingController mNumberController;
  late TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Student Details'),
      ),
      body: FutureBuilder(
          future: getStudentDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                Map<String, dynamic>? data = (snapshot.data);
                print(data);
                return SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: <Widget>[
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Student's Details",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: nameController,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: data?["result"]["name"],
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter the name',
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    controller: classController,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: data?["result"]["class"],
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter the class',
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    controller: divisionController,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: data?["result"]["section"],
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter the Division',
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    controller: rollNumberController,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText:
                                          data?["result"]["roll_no"].toString(),
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter the Roll Number',
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: data?["result"]["dob"]
                                          .toString()
                                          .substring(0, 10),
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter the date of birth',
                                    ),
                                    controller: dobController,
                                    onTap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: today,
                                        firstDate: DateTime(1900),
                                        lastDate: today,
                                      ).then((value) {
                                        dobController.text =
                                            value.toString().substring(0, 10);
                                      });
                                    },
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    controller: bloodGroupController,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: data?["result"]["blood_group"],
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter the Blood Group',
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    controller: genderController,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: data?["result"]["gender"],
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter the Gender',
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    controller: admissionNumberController,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: data?["result"]["admission_no"]
                                          .toString(),
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter the Admission number',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: <Widget>[
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Parent's Details",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: fatherController,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: data?["result"]["father_name"],
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter Father name',
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    controller: fNumberController,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: data?["result"]["father_phone"]
                                          .toString(),
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter Father Number',
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    controller: motherController,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: data?["result"]["mother_name"],
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter Mother name',
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    controller: mNumberController,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: data?["result"]["mother_phone"]
                                          .toString(),
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter Mother Number',
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    controller: addressController,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: 'Address',
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter the address',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: emailController,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      labelText: data?["result"]["email"],
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter email address',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              registerStudent();
                            },
                            child: Text('Update'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  void registerStudent() async {
    String? url = dotenv.env['SERVER'];

    var data = {
      'name': nameController.text,
      'grade': classController.text,
      'division': divisionController.text,
      'rollNumber': rollNumberController.text,
      'address': addressController.text,
      'dob': dobController.text.substring(0,10),
      'bloodGroup': bloodGroupController.text,
      'gender': genderController.text,
      'admissionNumber': admissionNumberController.text,
      'fatherName': fatherController.text,
      'motherName': motherController.text,
      'fatherNumber': fNumberController.text,
      'motherNumber': mNumberController.text,
      'email': emailController.text,
      'studentUsername': widget.roll_no,
      'parentUsername': parentUsername,
    };

    var response = await http
        .post(Uri.parse('https://${url}/teacher/update/student'), body: data);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Student Updated Successfully'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update student'),
        ),
      );
    }
  }
}
