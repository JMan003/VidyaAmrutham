import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class MentorAddition extends StatefulWidget {
  const MentorAddition({Key? key}) : super(key: key);

  @override
  State<MentorAddition> createState() => _MentorAdditionState();
}

class _MentorAdditionState extends State<MentorAddition> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController sUserController = TextEditingController();
  TextEditingController sPassController = TextEditingController();

  final today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mentor Registration'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              Colors.cyan,
              Colors.green,
            ],
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
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Mentor's Details",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: nameController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              labelText: 'Name',
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan),
                              ),
                              hintText: 'Enter the name',
                              hintStyle: TextStyle(color: Colors.white70),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: phoneController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan),
                              ),
                              hintText: 'Enter phone number',
                              hintStyle: TextStyle(color: Colors.white70),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: emailController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan),
                              ),
                              hintText: 'Enter the Email',
                              hintStyle: TextStyle(color: Colors.white70),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: addressController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              labelText: 'Address',
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan),
                              ),
                              hintText: 'Enter the Address',
                              hintStyle: TextStyle(color: Colors.white70),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: genderController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              labelText: 'Gender',
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan),
                              ),
                              hintText: 'Enter the Gender',
                              hintStyle: TextStyle(color: Colors.white70),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: sUserController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              labelText: "Mentor Username",
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan),
                              ),
                              hintText: "Enter Mentor's Username",
                              hintStyle: TextStyle(color: Colors.white70),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: sPassController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              labelText: "Mentor Password",
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan),
                              ),
                              hintText: "Enter Mentor's Password",
                              hintStyle: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ],
                      ),
                    ),
                    color: Colors.blue, // Adjust color as needed
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: registerStudent,
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void registerStudent() async {
    String? url = "387df06823a93fd406892e1c452f4b74.serveo.net";

    var data = {
      'username': sUserController.text,
      'name': nameController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'gender': genderController.text,
      'address': addressController.text,
      'password': sPassController.text,
    };

    var response = await http
        .post(Uri.parse('https://$url/dlsa/register/mentor'), body: data);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mentor Registered Successfully'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to register mentor'),
        ),
      );
    }
  }
}
