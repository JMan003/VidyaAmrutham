import 'package:flutter/material.dart';
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
        title: const Text('Student Registration'),
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
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    hintText: 'Enter the name',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: classController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Class',
                    border: OutlineInputBorder(),
                    hintText: 'Enter the class',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: divisionController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Division',
                    border: OutlineInputBorder(),
                    hintText: 'Enter the Division',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: rollNumberController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Roll Number',
                    border: OutlineInputBorder(),
                    hintText: 'Enter the Roll Number',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: addressController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                    hintText: 'Enter the address',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
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
                const SizedBox(height: 20),
                TextFormField(
                  controller: bloodGroupController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Blood Group',
                    border: OutlineInputBorder(),
                    hintText: 'Enter the Blood Group',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: genderController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                    hintText: 'Enter the Gender',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: admissionNumberController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Admission Number',
                    border: OutlineInputBorder(),
                    hintText: 'Enter the Admission number',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    registerStudent();
                  },
                  child: const Text('Register'),
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
        .post(Uri.parse('https://$url/teacher/register/student'), body: data);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Student Registered Successfully'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to register student'),
        ),
      );
    }
  }
}
