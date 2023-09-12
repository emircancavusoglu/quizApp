import 'package:flutter/material.dart';
import 'package:quizApp/constants/strings.dart';


class EndScreen extends StatelessWidget {
  const EndScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(Strings.congratulations,style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            )),
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            },child: Text(Strings.returnHome,style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.pink,
            )
            ),
            )
          ],
        ),
      ),
    );
  }
}
