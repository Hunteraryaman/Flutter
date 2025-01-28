import 'package:adv_basics/answer_button.dart';

import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(
      {/**required this.currentQuestionIndex,
      required this.currentQues tionIncrement,
      required this.backkk,*/
      required this.onSelectAnswer,
      super.key});
  final void Function(String answer)
      onSelectAnswer; //onSelect is used because it is the convenction when a function is required as an input
  // final void Function() backkk;
  // int currentQuestionIndex;
  // final void Function() currentQuestionIncrement;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(
        selectedAnswer); //this enables this state class to access the widgets of the parent class that is QuestionScreen
    setState(() {
      // if (currentQuestionIndex < questions.length - 2) {//this can be done to limit the questions
      //   currentQuestionIndex++;//but this is not used as we need to change the state of the screen after all questions have been atempted
      //   // print(questions.length);
      // }
      currentQuestionIndex++;
      // widget.currentQuestionIndex++;
    });
  }

  // void back() {
  //   setState(() {
  //     widget.currentQuestionIndex--;
  //     // print(widget.currentQuestionIndex);
  //     widget.backkk();
  //     // print(currentQuestionIndex);
  //   });
  // }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    // final currentQuestion = questions[widget.currentQuestionIndex];

    return
        // Center(//this is used to center the column
        // child: Column(
        SizedBox(
      //this is the other way of doing it
      width: double.infinity, //this means use as much width as you want
      child: Container(
        margin: const EdgeInsets.all(80),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment
              .center, //this is another way of centering it vertically
          crossAxisAlignment: CrossAxisAlignment
              .stretch, //this makes them streach out as wide as possible
          children: [
            Text(
              currentQuestion.questions,
              // style: TextStyle(
              //   color: Colors.white,
              // ),
              style: GoogleFonts.laBelleAurore(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            //this is executed automatically for all the answers by dart
            //thisi is called spreading ... these three dots spread the list into individual elements which are comma seperated
            ...currentQuestion.getShuffleAnswers().map(
              (answer) {
                //this conversion does not change the original list this returns a new list with new objects
                //thjis is a iterable object some what similar to list and we cant just givce that as output to column as colums requires widgets
                return AnswerButton(
                  answer: answer,
                  onTap: () {
                    //this is done as onTap accepst only void functions
                    answerQuestion(answer);
                  },
                ); //this converts the list of strings to a list of answer buttons
              },
            ),
            // AnswerButton(
            //     answer: 'back',
            //     onTap: () {
            //       back();
            //     }),

            // AnswerButton(currentQuestion.answers[0], () {}),//these are not required as we are using the map method which does this automatically
            // AnswerButton(currentQuestion.answers[1], () {}),
            // AnswerButton(currentQuestion.answers[2], () {}),
            // AnswerButton(currentQuestion.answers[3], () {}),
            // AnswerButton(currentQuestion.answers[4], () {}),
          ],
        ),
      ),
    );
  }
}
