import 'package:flutter/material.dart';
import 'question_model.dart';

class Quiz extends StatefulWidget {
  Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<Question>_myQuestion = myQuestions();
  bool isCorrect = false;
  bool isSelected = false;
  Answer answer = Answer("1963", true);
  Answer answer2 = Answer("1955", false);
  ValueNotifier<int> currentQuestionIndex = ValueNotifier<int>(0);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 35),
      child: Column(
        children: [
          const Text("Welcome to Quiz App",
            style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.w400),
          ),
          questionWidget(),
          const SizedBox(height: 10,),
          answerList(),
        ],
      ),
    );
  }

  questionWidget() {
    return Column(
     children: [
       ValueListenableBuilder<int>(
         valueListenable: currentQuestionIndex,
         builder: (context, questionIndex, child) {
           return Text(
             "Question '${questionIndex+1}'/'${_myQuestion.length}'",
             style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
           );
         }
       ),
       const SizedBox(height: 20,),
       Container(
         alignment: Alignment.center,
         width: double.infinity,
         padding: const EdgeInsets.all(32),
         decoration: BoxDecoration(
           boxShadow: [
             BoxShadow(
               color: Colors.blue.withOpacity(0.5),
               offset: const Offset(0,3),
           ),
           ]
         ),
         child: ValueListenableBuilder<int>(
           valueListenable: currentQuestionIndex,
           builder: (context, questionIndex, child) {
             return Text(_myQuestion[questionIndex].questionText);
           }
         ),
       )
     ],

    );
  }

  answerList() {
    return Column(
      children: [
        SizedBox(
          width: 400,
          height: 50,
          child: TextButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                ),
              backgroundColor: MaterialStateProperty.all(Colors.pink),
            ),
              onPressed: (){},
              child: Text(answer.answerText,style: const TextStyle(color: Colors.black),)),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 400,
          height: 50,
          child: TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.pink)
              ),
              onPressed: (){
            isCorrect = false;
            currentQuestionIndex.value = 1;
          }, child: Text(answer2.answerText,
            style: const TextStyle(color: Colors.black),)),
        )
      ],
    );

  }
}

