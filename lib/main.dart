import 'package:denemeyoutube/sorular.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title),),
        body: const MainScreen(),
      )
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.looks_one_rounded),
              title: Text("Which is better"),
              subtitle: Text("You have 3 minutes"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(onPressed: (){

                }, child: const Text("Puma")),

                TextButton(onPressed: (){

                }, child: const Text("Lion"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
