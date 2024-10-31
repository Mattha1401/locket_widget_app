// main.dart
import 'package:flutter/material.dart';
import 'package:locket/screens/home_screen.dart' as home; // Use alias 'home' for home_screen.dart


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Locket App',
      theme: ThemeData.dark(),
      home: home.HomeScreen(), // Use the 'home' alias here
    );
  }
}
