
import 'dart:core';

class Question{
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer{
  final String answerText;
  bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question>myQuestions(){
  List<Question>list = [];
  
  list.add(
    Question("Pirinç hangi ürünün kabuğunun soyulması ile elde edilir?",
      [
        Answer("Çeltik", true),
        Answer("Yulaf", false),

      ],)
  );
  list.add(
      Question("Bursasporun kuruluş yılı ?",
        [
          Answer("1963", true),
          Answer("1955", false),

        ],),
  );

  return list;
}