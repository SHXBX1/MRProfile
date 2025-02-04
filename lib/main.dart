import 'package:flutter/material.dart';
import 'screens/profile_screen.dart';
// import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Modern Profile 2024",
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}
