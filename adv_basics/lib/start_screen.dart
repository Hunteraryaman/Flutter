import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity(//this is not recommended
          // opacity: 0.35,//as this is quite performance intesive so we should avoid it if we can
          //   child: Image.asset(
          //     // '/Users/aryaman/Code/Flutter/flutter_projects/adv_basics/assets/images/quiz-logo.png',//the path is so big because i forgot to add it to the pubspect.ymal file
          //     'assets/images/quiz-logo.png', //this is with assesdt added in ymal file
          //     width: 300,
          //   ),
          // ),
          Image.asset(
            // '/Users/aryaman/Code/Flutter/flutter_projects/adv_basics/assets/images/quiz-logo.png',//the path is so big because i forgot to add it to the pubspect.ymal file
            'assets/images/quiz-logo.png', //this is with assesdt added in ymal file
            width: 300,
            color: const Color.fromARGB(
                172,
                255,
                255, //we used the transparancy slider to change the images opacity
                255), //we can use this approach whenever we have an option to set a colour
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          // const ElevatedButton(
          // onPressed: null, child: Text('Start Quiz')),
          OutlinedButton.icon(
            // ignore: avoid_print
            // onPressed: () {
            //   startQuiz();
            // },
            onPressed: startQuiz,

            
            style: OutlinedButton.styleFrom(
              // foregroundColor: const Color.fromARGB(255, 82, 27, 27), //text colour
              foregroundColor: Colors.white,
              side: const BorderSide(
                  color: Colors
                      .white), // Outline color//to add colour to the border got this from gpt
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius
                    .zero, // Rectangular corners//to add rectangular border gpt
              ),
            ),

            // child: const Text(
            //   'Start Quiz',
            //   // style: TextStyle(color: Colors.white),
            // ),
            icon: const Icon(Icons.quiz_outlined),

            label: const Text(
              //child is changed to lable and lable is used to define widget which then defines the non icon content of the button
              'Start Quiz',
              // style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
