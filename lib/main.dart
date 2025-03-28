import 'package:flutter/material.dart';
import 'package:superherp_app/sreens/superhero_serach_screan.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SuperheroSerachScreen(),
    );
  }
}
 