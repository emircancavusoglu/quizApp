import 'package:flutter/material.dart';
import 'package:denemeyoutube/question_model.dart';

class Quiz extends StatefulWidget {
  Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<Question>_myQuestion = myQuestions();
  bool isCorrect = false;
  bool isSelected = false;
  ValueNotifier<int> currentQuestionIndex = ValueNotifier<int>(0);
  ValueNotifier<int> currentAnswerIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 180),
        child: Column(
          children: [
            const Text("Welcome to Quiz App",
              style: TextStyle(fontSize: 24,color: Colors.blue,fontWeight: FontWeight.w500),
            ),
            questionWidget(),
            const SizedBox(height: 10,),
            answerList(),
          ],
        ),
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
             "Question ${questionIndex+1}/${_myQuestion.length}",
             style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.red),
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
             return Text(_myQuestion[questionIndex].questionText,
               style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 20),);
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
              onPressed: (){
              if(currentQuestionIndex.value <_myQuestion.length-1 &&
                  currentAnswerIndex.value < _myQuestion.length
              )
              {
                currentQuestionIndex.value += 1;
                currentAnswerIndex.value += 1;
              }
              else{
                currentQuestionIndex.value = 0;
                currentAnswerIndex.value = 0;
              }},
              child: ValueListenableBuilder<int>(
                valueListenable: currentAnswerIndex,
                builder: (context, answerIndex, child) {
                  return Text(
                    _myQuestion[currentQuestionIndex.value].answersList[0].answerText,
                    style: const TextStyle(color: Colors.black),);
                }
              )),
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
                if(currentQuestionIndex.value <_myQuestion.length-1 &&
                    currentAnswerIndex.value < _myQuestion.length){
                  currentQuestionIndex.value += 1;
                  currentAnswerIndex.value += 1;
                }

          }, child: ValueListenableBuilder<int>(
            valueListenable: currentAnswerIndex,
            builder: (context, answerIndex, child) {
              return Text(
              _myQuestion[currentQuestionIndex.value].answersList[1].answerText,
                style: const TextStyle(color: Colors.black),
              );
            }
          )
          ),
        )
      ],
    );
  }
}

