import 'package:Note_App/screens/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Note App",
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: SplashScreen(),
    );
  }
}
