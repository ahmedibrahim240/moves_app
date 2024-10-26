import 'package:flutter/material.dart';

void main() {
  runApp(const MovesApp());
}

class MovesApp extends StatelessWidget {
  const MovesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Moves',
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
     
    );
  }
}
