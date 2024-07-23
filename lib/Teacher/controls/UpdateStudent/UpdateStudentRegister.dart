import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    String? url = "dlsatestserver.serveo.net";
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
  void initState() {
    super.initState();
    dobController = TextEditingController();
    nameController = TextEditingController();
    classController = TextEditingController();
    divisionController = TextEditingController();
    rollNumberController = TextEditingController();
    addressController = TextEditingController();
    bloodGroupController = TextEditingController();
    genderController = TextEditingController();
    admissionNumberController = TextEditingController();
    fatherController = TextEditingController();
    motherController = TextEditingController();
    fNumberController = TextEditingController();
    mNumberController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    dobController.dispose();
    nameController.dispose();
    classController.dispose();
    divisionController.dispose();
    rollNumberController.dispose();
    addressController.dispose();
    bloodGroupController.dispose();
    genderController.dispose();
    admissionNumberController.dispose();
    fatherController.dispose();
    motherController.dispose();
    fNumberController.dispose();
    mNumberController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Update Student Details'),
          backgroundColor: Colors.blue, // Customize app bar color
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue,
                Colors.cyan,
                Colors.purple,
              ],
            ),
          ),
          child: FutureBuilder(
            future: getStudentDetails(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  Map<String, dynamic>? data =
                      (snapshot.data as Map<String, dynamic>);
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
                                        color: Colors.blue,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: nameController,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        labelText: 'Name',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      controller: classController,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        labelText: 'Class',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      controller: divisionController,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        labelText: 'Division',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      controller: rollNumberController,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        labelText: 'Roll Number',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        labelText: 'Date of Birth',
                                        border: OutlineInputBorder(),
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
                                        labelText: 'Blood Group',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      controller: genderController,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        labelText: 'Gender',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      controller: admissionNumberController,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        labelText: 'Admission Number',
                                        border: OutlineInputBorder(),
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
                                        color: Colors.blue,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: fatherController,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        labelText: 'Father\'s Name',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      controller: fNumberController,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        labelText: 'Father\'s Number',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      controller: motherController,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        labelText: 'Mother\'s Name',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      controller: mNumberController,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        labelText: 'Mother\'s Number',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      controller: addressController,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        labelText: 'Address',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      controller: emailController,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        labelText: 'Email Address',
                                        border: OutlineInputBorder(),
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
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                              ),
                              child: Text(
                                'Update',
                                style: TextStyle(color: Colors.white),
                              ),
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
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ));
  }

  void registerStudent() async {
    String? url = "dlsatestserver.serveo.net";

    var data = {
      'name': nameController.text,
      'grade': classController.text,
      'division': divisionController.text,
      'rollNumber': rollNumberController.text,
      'address': addressController.text,
      'dob': dobController.text.substring(0, 10),
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
