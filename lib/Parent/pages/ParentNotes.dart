import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidyaamrutham/Parent/pages/ParentControls.dart';
import 'package:vidyaamrutham/Parent/pages/ParentDashboard.dart';
import 'package:vidyaamrutham/Parent/pages/ParentProfile.dart';
import 'package:vidyaamrutham/components/Drawer.dart';

int _selectedIndex = 2;
double? containerHeight,
    containerWidth,
    innerContainerWidth,
    innerContainerHeight,
    controllerContainerWidth,
    controllerContainerHeight;
final String studentName = "Student's Name";
final String studentAdmissionNo = "123456";
final String studentGrade = "Grade 10";
final String studentClass = "10 A";

class ParentNotes extends StatefulWidget {
  const ParentNotes({Key? key}) : super(key: key);
  @override
  State<ParentNotes> createState() => ProfileState();
}

class ProfileState extends State<ParentNotes> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      final notes = prefs.getString('notes') ?? '';
      myController.text = notes;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    containerHeight = screenHeight * 0.67;
    double screenWidth = MediaQuery.of(context).size.width;
    containerWidth = screenWidth * 0.9;
    innerContainerWidth = screenWidth * 0.9;
    innerContainerHeight = screenHeight * 0.35;

    return Scaffold(
      body: Column(children: [
        Expanded(child: Container()),
        Container(
            height: containerHeight,
            width: double.infinity,
            decoration: const ShapeDecoration(
              color: Color(0xFFD9D9D9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(63),
                  topRight: Radius.circular(63),
                ),
              ),
            ),
            child: Column(children: [
              const Align(
                child: Padding(
                  padding: EdgeInsets.only(top: 50, left: 20),
                  child: Row(
                    children: [
                      Align(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Personal Notes',
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 85, 85, 85)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Scrollable(viewportBuilder:
                  (BuildContext context, ViewportOffset position) { 
                // Remove the 'Set<MaterialState> states' parameter
                return Column(
                  children: [
                    Container(
                      width: innerContainerWidth,
                      height: innerContainerHeight,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF7F2FA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x26000000),
                            blurRadius: 3,
                            offset: Offset(0, 1),
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: Color(0x4C000000),
                            blurRadius: 2,
                            offset: Offset(0, 1),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            maxLines: null,
                            controller: myController,
                            decoration: const InputDecoration(
                              labelText: 'Enter your text',
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          )),
                    ),
                    ElevatedButton(
                        onPressed: saveText, child: const Text('Save')),
                  ],
                );
              }),
            ])),
      ]),
    );
  }

  void saveText() {
    final enteredText = myController.text;
    // Save enteredText to your storage. For example, to shared preferences or to your database.
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('notes', enteredText);
    });
    showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text('Saved'),
      content: const Text('Your notes have been saved.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    ));
  }
}