import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:vidyaamrutham/DLSA/components/mentor_list.dart';
import 'dart:convert';

import 'package:vidyaamrutham/DLSA/components/student_list.dart';

String number_of_mentors = '', number_of_students = '';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height1 = MediaQuery.of(context).size.height;
    double width1 = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: buildElevatedListTile(width1, height1),
      ),
    );
  }

  Future<Map<String,dynamic>> getCount() async {
    print("Fetching data");
    String? url = dotenv.env['SERVER'];
    var response = await http.get(Uri.parse('http://$url/dlsa/count'));
    print(response.body);
    number_of_students = json.decode(response.body)['result'][0]['COUNT(id)'].toString();
    number_of_mentors = json.decode(response.body)['result'][1]['COUNT(username)'].toString();
    return json.decode(response.body);
  }

  Widget buildElevatedListTile(double width1, double height1) {
    return FutureBuilder<Map<String,dynamic>>(
      future: getCount(), 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(40.0),
          ),
          color: Colors.grey[200],
        ),
        child: Column(
          children: [
            const SizedBox(height: 15.0), // Add some space at the top
            Container(
              height: height1 * 0.23,
              width: width1 * 0.90,
              child: Card(
                color: const Color(0xFFF3EDF7),
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text(
                          'Number of Students',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Container(
                          height: 67.5,
                          width: 65.17,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF9AA2E6),
                              width:
                                  7, // Adjust the width of the circular border as needed
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(
                                  8.0), // Adjust padding as needed
                              child: Text(
                                number_of_students,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      15, // Customize the text color inside the circular border
                                ),
                              ),
                            ),
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 8.0),
                        //leading:Icon(Icons.star), // Replace with your desired leading icon
                        //trailing: Icon(Icons.arrow_forward), // Replace with your desired trailing icon
                        onTap: () {
                          // Handle onTap action
                        },
                      ),
                    ),

                    //Vertical Divider
                    //VerticalDivider(
                    //  width: 1,
                    //  color: Colors.black,
                    //),

                    Expanded(
                      child: ListTile(
                        title: const Text(
                          'Number of Mentors',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Poppins",
                            color: Colors.black,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Container(
                          height: 67.5,
                          width: 65.17,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF9AA2E6),
                              width:
                                  7, // Adjust the width of the circular border as needed
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(
                                  8.0), // Adjust padding as needed
                              child: Text(
                                number_of_mentors,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      15, // Customize the text color inside the circular border
                                ),
                              ),
                            ),
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 8.0),
                        onTap: () {
                          // Handle onTap action
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Student and Mentor List Card
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  color: const Color(0xFFF3EDF7),
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    width: width1 * 0.4,
                    height: height1 *
                        0.18, // Adjust the width of each card as needed
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StudentList()
                                  )
                              );
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Students List',
                              style: TextStyle(
                                fontSize: 18.0,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Icon(Icons.list_alt, size: 50, color: Colors.black),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Icon(Icons.arrow_forward,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  color: const Color(0xFFF3EDF7),
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    width: width1 * 0.4,
                    height: height1 *
                        0.18, // Adjust the width of each card as needed
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MentorList()
                                  )
                              );
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Mentors List',
                              style: TextStyle(
                                fontSize: 18.0,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Icon(Icons.list_alt, size: 50, color: Colors.black),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //Functions tile
            const SizedBox(height: 15.0),
            const Row(),
          ],
        ),
      ),

      );
  }
  return Center(child: CircularProgressIndicator(),);
      },
    );
  }
}