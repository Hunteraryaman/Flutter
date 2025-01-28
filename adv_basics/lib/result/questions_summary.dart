import 'package:adv_basics/result/question_identifier.dart';
import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({
    required this.summaryData,
    super.key,
  });

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    // final bool a = summaryData['is_correct'] as bool;
    return SizedBox(
      height: 400,
      width: 5500,
      child: SingleChildScrollView(
        //this takes one child and makes it scrollable
        child: Column(
          children: summaryData.map((data) {
            return Padding(
              // padding: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                //max width of row is the max screen width
                children: [
                  QuestionIdentifier(
                    data,
                    isCorrect: data['is_correct'] as bool,
                    // isCorrect: true,
                    // isCorrect: data['is_correct'] as bool? ?? false,
                    index: data['question_index'] as int,
                  ),
                  // Text(((data['question_index'] as int) /*this is type casting */ + 1)
                  // .toString()),
                  Expanded(
                    //this limits its child widget to take the max  space of the parent widget
                    //this breaks the line into two
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        // const SizedBox(
                        // height: 5,
                        // ),
                        Text(
                          data['user_answer'] as String,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 199, 155, 224)),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          data['correct_answers'] as String,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 121, 142, 213)),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(), //this is converting the iterable object to list
        ),
      ),
    );
  }
}
