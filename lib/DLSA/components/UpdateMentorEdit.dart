import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:vidyaamrutham/DLSA/pages/controls.dart';
import 'package:vidyaamrutham/Mentor/pages/profile.dart';

class UpdateMentorEdit extends StatefulWidget {
  final String username;

  const UpdateMentorEdit({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  State<UpdateMentorEdit> createState() => _UpdateMentorEditState();
}

class _UpdateMentorEditState extends State<UpdateMentorEdit> {
  String usernmae = "",
      name = "",
      address = "",
      gender = "",
      phone = "",
      email = "";

  final today = DateTime.now();

  Future<Map<String, dynamic>> getStudentDetails() async {
    String? url = "387df06823a93fd406892e1c452f4b74.serveo.net";
    var response = await http
        .get(Uri.parse('https://$url/mentor/update/${widget.username}'));

    var result = jsonDecode(response.body)['result'];
    name = result['mentor_name'].toString();
    address = result['address'].toString();
    gender = result['gender'].toString();
    email = result['email'].toString();
    phone = result['phone'].toString();

    nameController = TextEditingController(text: name);
    addressController = TextEditingController(text: address);
    genderController = TextEditingController(text: gender);
    emailController = TextEditingController(text: email);
    phoneController = TextEditingController(text: phone);
    usernmaeController = TextEditingController(text: usernmae);

    return result;
  }

  late TextEditingController nameController;
  late TextEditingController addressController;
  late TextEditingController genderController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController usernmaeController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Mentor Details'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
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
          ),
          FutureBuilder(
            future: getStudentDetails(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  Map<String, dynamic> data =
                      snapshot.data as Map<String, dynamic>;
                  return SingleChildScrollView(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                            20.0, kToolbarHeight + 20.0, 20.0, 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              color: Colors.blue, // Adjust color as needed
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      "Mentor's Details",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: nameController,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        labelText: 'Name',
                                        border: const OutlineInputBorder(),
                                        hintText: 'Enter the name',
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      controller: genderController,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        labelText: 'Gender',
                                        border: const OutlineInputBorder(),
                                        hintText: 'Enter the Gender',
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      controller: addressController,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        labelText: 'Address',
                                        border: const OutlineInputBorder(),
                                        hintText: 'Enter the Address',
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      controller: emailController,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        border: const OutlineInputBorder(),
                                        hintText: 'Enter the Email',
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      controller: phoneController,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        labelText: 'Phone Number',
                                        border: const OutlineInputBorder(),
                                        hintText: 'Enter the Phone Number',
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: updateMentor,
                              child: const Text('Update'),
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
            },
          ),
        ],
      ),
    );
  }

  void updateMentor() async {
    String? url = "387df06823a93fd406892e1c452f4b74.serveo.net";

    var data = {
      'name': nameController.text,
      'address': addressController.text,
      'gender': genderController.text,
      'email': emailController.text,
      'username': widget.username,
      'phone': phoneController.text,
    };

    var response = await http.post(
      Uri.parse('https://$url/dlsa/update/mentor'),
      body: data,
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mentor Data Updated Successfully'),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ControlPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to update mentor details'),
        ),
      );
    }
  }
}
