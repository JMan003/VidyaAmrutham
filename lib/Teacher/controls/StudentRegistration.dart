import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class StudentRegistration extends StatefulWidget {
  const StudentRegistration({Key? key}) : super(key: key);

  @override
  State<StudentRegistration> createState() => _StudentRegistrationState();
}

class _StudentRegistrationState extends State<StudentRegistration> {
  TextEditingController dobController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController divisionController = TextEditingController();
  TextEditingController rollNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController admissionNumberController = TextEditingController();

  final today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Registration'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: nameController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    hintText: 'Enter the name',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: classController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Class',
                    border: OutlineInputBorder(),
                    hintText: 'Enter the class',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: divisionController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Division',
                    border: OutlineInputBorder(),
                    hintText: 'Enter the Division',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: rollNumberController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Roll Number',
                    border: OutlineInputBorder(),
                    hintText: 'Enter the Roll Number',
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
                SizedBox(height: 20),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Date of Birth',
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
                      dobController.text = value.toString().substring(0, 10);
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
                    hintText: 'Enter the Blood Group',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: genderController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                    hintText: 'Enter the Gender',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: admissionNumberController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Admission Number',
                    border: OutlineInputBorder(),
                    hintText: 'Enter the Admission number',
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    registerStudent();
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void registerStudent() async{
    String? url = dotenv.env['SERVER'];

    var data = {
      'name': nameController.text,
      'grade': classController.text,
      'division': divisionController.text,
      'rollNumber': rollNumberController.text,
      'address': addressController.text,
      'dob': dobController.text,
      'bloodGroup': bloodGroupController.text,
      'gender': genderController.text,
      'admissionNumber': admissionNumberController.text
    };

    var response = await http
        .post(Uri.parse('https://${url}/teacher/register/student'), body: data);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Student Registered Successfully'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to register student'),
        ),
      );
    }
  }
}
