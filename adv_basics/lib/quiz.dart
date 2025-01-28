// import 'dart:ui';

import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/result/result_screen.dart';
import 'package:adv_basics/start_screen.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
// Widget activeScreen = const StartScreen(switchScreen);//this gives an error because we cant set two things that are connected simultaniously when creatinig a object
//as it is not guretied that switchScreen is available

  // Widget? activeScreen;
  // @override
  // void initState() {//this is used to initialise content after the object creation
  // super.initState();
  // activeScreen = StartScreen(switchScreen);//no set state required as init is executed before build
  // }

  // var activeScreen = "start-screen";
  var activeScreen = "active-screen";

  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionsScreen();
      activeScreen = "questions-screen";
    });
  }

  // int currentQuestionIndex = 0;
  // void currentQuestionIncrement() {
  //   currentQuestionIndex++;
  // }

  void choosedAnswer(String answer) {
    selectedAnswers
        .add(answer); //adds an element and increases the size of the list
    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers =
        // []; //this is removed as it will be added when we add restart quiz button
        // selectedAnswers.removeRange(
        //     0,
        //     selectedAnswers
        //         .length); //this here removes all the elements of the list and makes it empty
        //i can still use final here because i did not reassign anything instead used the methods
        activeScreen = 'result-screen';
      });
    }
  }

  // void backScreen() {
  //   // var cnt = 0;
  //   setState(() {
  //     // print(selectedAnswers.length);
  //     // print(selectedAnswers[cnt]);
  //     if (selectedAnswers.isNotEmpty) {
  //       selectedAnswers.removeLast();
  //       // print(cnt++);
  //     }
  //     if (selectedAnswers.isEmpty) {
  //       //this is used to see if it is empty
  //       activeScreen = 'result-screen';
  //     }
  //   });
  // }

  void restartQuiz() {
    selectedAnswers = [];
    setState(() {
      activeScreen = 'start_screen';
    });
  }

  @override
  Widget build(context) {
    // final screenWidget = activeScreen ==
    //         "start-screen" //this is passing a widget through ternary operator
    //     ? StartScreen(switchScreen) //less readable
    //     : const QuestionsScreen();//this has better redability as it is outside of the widget tree

    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == "questions-screen") {
      screenWidget = QuestionsScreen(
        onSelectAnswer: choosedAnswer,
        // backkk: backScreen,
        // currentQuestionIncrement: currentQuestionIncrement,
        // currentQuestionIndex: currentQuestionIndex,
      );
    }
    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        choosenAnswers: selectedAnswers,
        restart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.deepPurple],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          // child:activeScreen,//thsi is passing a widget used with init state
          // child: activeScreen == "start-screen"//this is passing a widget through ternary operator
          //     ? StartScreen(switchScreen)//less readable
          //     : const QuestionsScreen()),
          child: screenWidget,
        ),
      ),
    );
  }
}
