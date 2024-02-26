import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class StudentRegistration extends StatefulWidget {
  const StudentRegistration({Key? key}) : super(key: key);

  @override
  State<StudentRegistration> createState() => _StudentRegistrationState();
}

class _StudentRegistrationState extends State<StudentRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Registration'),
      ),
      body: Scrollable(
        viewportBuilder: (BuildContext context, ViewportOffset position) {
          return Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'First Name',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Phone',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Address',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'City',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'State',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Zip',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (Form.of(primaryFocus!.context!)!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
