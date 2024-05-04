import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

double? containerHeight,
    containerWidth,
    innerContainerWidth,
    innerContainerHeight,
    controllerContainerWidth,
    controllerContainerHeight;

class Grievance extends StatelessWidget {
  final roll_no;
  final mentor_id;

  Grievance({
    Key? key,
    required this.roll_no,
    required this.mentor_id,
  }) : super(key: key);

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    containerHeight = screenHeight * 0.67;
    double screenWidth = MediaQuery.of(context).size.width;
    containerWidth = screenWidth * 0.9;
    innerContainerWidth = screenWidth * 0.9;
    innerContainerHeight = screenHeight * 0.35;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Grievance'),
        ),
        body: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Scrollable(viewportBuilder:
                      (BuildContext context, ViewportOffset position) {
                    // Remove the 'Set<MaterialState> states' parameter
                    return Column(
                      children: [
                        Card(
                          elevation: 0.5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                              height: innerContainerHeight,
                              width: innerContainerWidth,
                              //color: Colors.white,
                              child: TextField(
                                maxLength: 1000,
                                maxLines: null,
                                controller: myController,
                                decoration: const InputDecoration(
                                  hintText: 'Enter your text',
                                  border: InputBorder.none,
                                  
                                ),
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 198, 191, 191),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              grievance_of_Student(context);
                            },
                            child: const Text('Save')),
                      ],
                    );
                  }),
                ]))));
  }

   void grievance_of_Student(context) async {
     String? url = dotenv.env['SERVER'];

     var data = {'mentor_id': mentor_id, 'grievance': myController.text};

     var response = await http
         .post(Uri.parse('https://${url}/teacher/grievance'), body: data);

     if (response.statusCode == 200) {
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
           content: Text('Successful'),
         ),
       );
     } else {
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
           content: Text('Failed to add to grievance'),
         ),
       );
     }
   }
}
