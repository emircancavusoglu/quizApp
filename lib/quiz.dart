import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizApp/constants/strings.dart';
import 'question_model.dart';
import 'endScreen.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<Question>_myQuestion = myQuestions();
  final ValueNotifier<int>point = ValueNotifier<int>(0);
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
    final theme = Theme.of(context);
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 180),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(Strings.welcome,
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: Colors.blue,
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                ),
              ),
              questionWidget(),
              const SizedBox(height: 10,),
              answerList(),
              const SizedBox(height: 20,),
              ValueListenableBuilder<int>(
                valueListenable: point,
                builder: (context, _point, _) {
                  return Text("Puan : $_point",style: theme.textTheme.headlineMedium?.copyWith(
                    color: Colors.indigo,
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                  );
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
              }else{
              showDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                title: Text("Congratulations! Your Point : ${point.value}"),
                content: const Text("Do you want to continue ? "),
                actions: [
                  CupertinoDialogAction(child: TextButton(onPressed: (){
                    currentQuestionIndex.value = 0;
                    currentAnswerIndex.value += 1;
                    point.value = 0;
                    Navigator.of(context).pop();
                  }, child: const Text("Yes"),)
                  ),
                CupertinoDialogAction(child: TextButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EndScreen(),));
                }, child: const Text("No"),
                )
                )
                ],
              ),
              );
              };
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
                  showDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: Text("Congratulations! Your Point : ${point.value}"),
                      content: const Text("Do you want to continue ? "),
                      actions: [
                        CupertinoDialogAction(child: TextButton(onPressed: (){
                          currentQuestionIndex.value = 0;
                          currentAnswerIndex.value += 1;
                          point.value = 0;
                          Navigator.of(context).pop();
                        }, child: const Text("Yes"),)
                        ),
                        CupertinoDialogAction(child: TextButton(onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EndScreen(),));
                        }, child: const Text("No"),
                        )
                        )
                      ],
                    ),
                  );
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

