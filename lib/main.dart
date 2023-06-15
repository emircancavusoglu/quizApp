import 'package:flutter/material.dart';
import 'quiz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = "Quiz App";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title),),
        body: const Center(child: Quiz()),
      )
    );
  }
}