import 'package:flutter/material.dart';
import 'sorular.dart';

class ekran extends StatefulWidget {
  const ekran({Key? key}) : super(key: key);

  @override
  State<ekran> createState() => _ekranState();
}

class _ekranState extends State<ekran> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            ListView.builder(itemBuilder: (BuildContext context,int index) {
              return ListTile(
                title: Text(sorularCevaplar.toString()[index]),
                subtitle: Text(sorularCevaplar.toString()[index]),
              );
            },)
          ],
        ),
      ),
    );
  }
}
