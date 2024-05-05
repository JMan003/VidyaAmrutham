import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

double? containerHeight,
    containerWidth,
    innerContainerWidth,
    innerContainerHeight,
    controllerContainerWidth,
    controllerContainerHeight;

class MentorNotes extends StatefulWidget {
  const MentorNotes({Key? key}) : super(key: key);
  @override
  State<MentorNotes> createState() => ProfileState();
}

class ProfileState extends State<MentorNotes> {
  final myController = TextEditingController();
  final myController1 = TextEditingController();

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      final notes = prefs.getString('notes') ?? '';
      myController.text = notes;
      final notes1 = prefs.getString('notes1') ?? '';
      myController1.text = notes1;
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

    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Container(
          //height: screenHeight - 100,
          width: double.infinity,
          padding: EdgeInsets.only(bottom: 56),
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
                          'Social Life of Student',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF514D4D)),
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
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: saveText, child: const Text('Save')),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Academic Improvements ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF514D4D),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                          controller: myController1,
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
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: saveText1, child: const Text('Save')),
                ],
              );
            }),
          ]),
        ),
      ),
    );
  }

  void saveText() {
    final enteredText = myController.text;
    // Save enteredText to your storage. For example, to shared preferences or to your database.
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('notes', enteredText);
    });
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
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

  void saveText1() {
    final enteredText = myController1.text;
    // Save enteredText to your storage. For example, to shared preferences or to your database.
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('notes1', enteredText);
    });
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
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

