import 'package:flutter/material.dart';

class LocketGoldScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Locket Gold',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center( // Center widget to align children in the center
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the column vertically
            children: [
              // Logo Image
              Image.asset(
                'assets/images/logo.jpg', 
                height: 100, // Adjust height as needed
                width: 100, // Adjust width as needed
              ),
              SizedBox(height: 20),
              Text(
                'Locket Gold',
                style: TextStyle(
                  color: Colors.amber[800],
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Unlock the best of Locket with exclusive features, offers, and more!',
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add your logic for upgrading or more details
                },
                child: Text('Upgrade Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


