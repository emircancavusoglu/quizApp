import 'package:flutter/material.dart';
import 'package:quizApp/constants/strings.dart';


class EndScreen extends StatelessWidget {
  const EndScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(Strings.congratulations,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25,color: Colors.blue),),
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            },child: const Text(Strings.returnHome,style: TextStyle(fontSize: 23,fontWeight: FontWeight.w400,color: Colors.pink),
            ),
            )
          ],
        ),
      ),
    );
  }
}
