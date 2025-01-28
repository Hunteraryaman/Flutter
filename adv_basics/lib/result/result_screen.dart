import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/result/questions_summary.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.choosenAnswers,
    required this.restart,
  });

  final List<String> choosenAnswers;

  final void Function() restart;

  // List<Map<String, Object>> getSummaryData() {
  //   /**here the first one is key and second one is value */
  //   final List<Map<String, Object>> summary = [];
  //   for (var i = 0; i < choosenAnswers.length; i++) {
  //     bool a = false;
  //     if (choosenAnswers[i] == questions[i].answers[0]) {
  //       a = true;
  //     }

  //     summary.add({
  //       'question_index': i,
  //       'question': questions[i].questions,
  //       'correct_answers':
  //           questions[i].answers[0], //0 as the first ans is the right one
  //       'user_answer': choosenAnswers[i],
  //       'is_correct': a,
  //     });
  //   }
  //   return summary;
  // }

  List<Map<String, Object>> get summaryData {
    //this is a getter which is still a method but we dont need to call this method but can refer to it as a variable
    /**here the first one is key and second one is value */
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswers.length; i++) {
      bool a = false;
      if (choosenAnswers[i] == questions[i].answers[0]) {
        a = true;
      }

      summary.add({
        'question_index': i,
        'question': questions[i].questions,
        'correct_answers':
            questions[i].answers[0], //0 as the first ans is the right one
        'user_answer': choosenAnswers[i],
        'is_correct': a,
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;

    // final numCorrectQuestions = summaryData.where((data) {
    //   return data['user_answer'] ==
    //       data['correct_answers']; //if true we add that answer in the list
    // }).length; //this is just like map which allows to filter the list and this doesm't change the list but gives a new list

    final numCorrectQuestions = summaryData
        .where((data) => data['user_answer'] == data['correct_answers']
            //if true we add that answer in the list
            )
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.stretch  ,
          children: [
            Text(
              'You answered $numCorrectQuestions questions correctly out of $numTotalQuestions questions!!',
              style: const TextStyle(
                  color: Color.fromARGB(255, 105, 118, 177),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),

            QuestionsSummary(
              summaryData: summaryData,
            ),
            // const Text('data'),
            const SizedBox(
              height: 40,
            ),
            TextButton.icon(
              onPressed: restart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(
                Icons.restart_alt_rounded,
                color: Colors.white,
              ),
              label: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
