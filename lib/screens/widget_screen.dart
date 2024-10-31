import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Profile", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WidgetPage(initialIndex: 1)),
            );
          },
          child: Text("Go to Widget Page"),
        ),
      ),
    );
  }
}

class WidgetPage extends StatelessWidget {
  final int initialIndex;

  // Ensure that the constructor includes the named parameter
  WidgetPage({Key? key, required this.initialIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center( // Center the Column widget
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
          children: [
            Text(
              "Add the widget to your home screen",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 60), // Space between texts
            Container(
              height: 300,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[800],
              ),
              child: Center(
                child: Text(
                  'Phone Illustration',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 60), // Space between container and next text
            Text(
              "Search for Locket and add the widget",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
