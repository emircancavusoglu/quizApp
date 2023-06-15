import 'package:flutter/material.dart';
import 'question_model.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<Question>_myQuestion = myQuestions();
  ValueNotifier<int>point = ValueNotifier<int>(0);
  ValueNotifier<int> currentQuestionIndex = ValueNotifier<int>(0);
  ValueNotifier<int> currentAnswerIndex = ValueNotifier<int>(0);


  void incrementPoint(int selected) {
    bool correctAnswer = _myQuestion[currentQuestionIndex.value].answersList[selected]
            .isCorrect;
    if (correctAnswer) {
      point.value++;
    }
    currentAnswerIndex.value = selected;
    }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 180),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text("Welcome to Quiz App",
                style: TextStyle(fontSize: 24,color: Colors.blue,fontWeight: FontWeight.w500),
              ),
              questionWidget(),
              const SizedBox(height: 10,),
              answerList(),
              const SizedBox(height: 20,),
              ValueListenableBuilder<int>(
                valueListenable: point,
                builder: (context, _point, _) {
                  return Text("Puan : $_point",style: const TextStyle(
                      fontSize: 24,fontWeight: FontWeight.w500,color: Colors.indigo),);
                }
              ),
            ],
          ),
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

  Widget answerList() {
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
              onPressed: () {
              incrementPoint(0);
              if(_myQuestion.length-1 > currentQuestionIndex.value&&
              currentAnswerIndex.value < _myQuestion.length
              ){
                currentQuestionIndex.value++;
                currentAnswerIndex.value++;
              }
              else{
                currentAnswerIndex.value = 0;
                currentQuestionIndex.value= 0;
              }
              },
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
              onPressed: () {
                incrementPoint(1);
                if(_myQuestion.length-1 > currentQuestionIndex.value&&
                    currentAnswerIndex.value < _myQuestion.length
                ){
                  currentQuestionIndex.value++;
                  currentAnswerIndex.value++;
                }
                else{
                  currentAnswerIndex.value = 0;
                  currentQuestionIndex.value= 0;
                }

              },
              child: ValueListenableBuilder<int>(
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

