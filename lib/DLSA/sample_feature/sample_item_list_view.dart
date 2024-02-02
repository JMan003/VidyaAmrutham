import 'package:flutter/material.dart';
import '../Navigations/bottomnavbar.dart';
import '../settings/settings_view.dart';
import 'sample_item.dart';
import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  });

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Text('Vidyamruthum'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          // User profile icon and name
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // User profile icon (replace with your desired icon)
                CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person, // Replace with the desired icon
                    size: 50.0, // Adjust the size of the icon as needed
                    color: Colors.blue, // Customize the color of the icon
                  ),
                ),
                // Space between icon and name
                SizedBox(width: 16.0),

                // User profile name
                Text(
                  'DLSA', // Replace with the user's profile name
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Elevated List Card
          buildElevatedListTile(),

          // Sample ListView
          /*ListView.builder(
            shrinkWrap: true,
            // Providing a restorationId allows the ListView to restore the
            // scroll position when a user leaves and returns to the app after it
            // has been killed while running in the background.
            restorationId: 'sampleItemListView',
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = items[index];

              return ListTile(
                title: Text('SampleItem ${item.id}'),
                leading: const CircleAvatar(
                  // Display the Flutter Logo image asset.
                  foregroundImage: AssetImage('assets/images/flutter_logo.png'),
                ),
                onTap: () {
                  // Navigate to the details page. If the user leaves and returns to
                  // the app after it has been killed while running in the
                  // background, the navigation stack is restored.
                  Navigator.restorablePushNamed(
                    context,
                    SampleItemDetailsView.routeName,
                  );
                },
              );
            },
          ),*/
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget buildElevatedListTile() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 170,
            width: 320,
            child: Card(
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width:
                                9, // Adjust the width of the circular border as needed
                          ),
                        ),
                        child: const Center(
                          child: Padding(
                            padding:
                                EdgeInsets.all(8.0), // Adjust padding as needed
                            child: Text(
                              '99',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    25, // Customize the text color inside the circular border
                              ),
                            ),
                          ),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                      //leading:Icon(Icons.star), // Replace with your desired leading icon
                      //trailing: Icon(Icons.arrow_forward), // Replace with your desired trailing icon
                      onTap: () {
                        // Handle onTap action
                      },
                    ),
                  ),

                  //Vertical Divider
                  const VerticalDivider(
                    width: 1,
                    color: Colors.white,
                  ),

                  Expanded(
                    child: ListTile(
                      title: const Text(
                        'Number of Mentors',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width:
                                9, // Adjust the width of the circular border as needed
                          ),
                        ),
                        child: const Center(
                          child: Padding(
                            padding:
                                EdgeInsets.all(8.0), // Adjust padding as needed
                            child: Text(
                              '103',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    25, // Customize the text color inside the circular border
                              ),
                            ),
                          ),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
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
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  width: 150.0, // Adjust the width of each card as needed
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        //add functionality
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Students List',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Icon(
                            Icons.list_alt,
                            size: 50,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(Icons.arrow_forward),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  width: 150.0, // Adjust the width of each card as needed
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        //add functionality
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Mentors List',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Icon(
                            Icons.list_alt,
                            size: 50,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(Icons.arrow_forward),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
