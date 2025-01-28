import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(Map<String, Object> data,
      {super.key, required this.isCorrect, required this.index});

  final bool isCorrect;
  final int index;
  @override
  Widget build(BuildContext context) {
    final qindex = index + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrect ? Colors.blue : Colors.red,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        qindex.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}