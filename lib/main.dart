import 'package:denemeyoutube/sorular.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const soru_ekran(title: 'Flutter Demo Home Page'),
    );
  }
}

class soru_ekran extends StatefulWidget {
  const soru_ekran({super.key, required this.title});

  final String title;

  @override
  State<soru_ekran> createState() => _soru_ekranState();
}

class _soru_ekranState extends State<soru_ekran> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Column(
          children: [
            ListView.builder(itemBuilder: (BuildContext context, int index) {
              return ListTile(

              );
            },)
          ],
        ),
      ),
    );
  }
}