import 'package:flutter/material.dart';
import 'main.dart';
import 'question_model.dart';
import 'quiz.dart';



class endScreen extends StatelessWidget {
  const endScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Congratulations! ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25,color: Colors.blue),),
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            },child: const Text("Return to the home screen ",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w400,color: Colors.pink),
            ),
            )
          ],
        ),
      ),
    );
  }
}
