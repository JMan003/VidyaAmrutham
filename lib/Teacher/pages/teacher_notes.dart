import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

double? containerHeight,
    containerWidth,
    innerContainerWidth,
    innerContainerHeight,
    controllerContainerWidth,
    controllerContainerHeight;

class Teacher3 extends StatelessWidget {
  Teacher3({Key? key}) : super(key: key);

  final myController = TextEditingController();
  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      final notes = prefs.getString('notes') ?? '';
      myController.text = notes;
    });
  }

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    containerHeight = screenHeight * 0.67;
    double screenWidth = MediaQuery.of(context).size.width;
    containerWidth = screenWidth * 0.9;
    innerContainerWidth = screenWidth * 0.9;
    innerContainerHeight = screenHeight * 0.35;

    return Container(
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
            ]));
            
      
  }

  

  void saveText() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('notes', myController.text);
    });
    const AboutDialog(
      applicationName: "Notes Saved",
      applicationVersion: "1.0",
      applicationIcon: Icon(Icons.save),
      children: [
        Text("Your notes have been saved"),
      ],
    );
  }
}