import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  TitleText({super.key, required this.textEditingController});

  TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController, //this automatically stores the text
      // onChanged:
      // _saveTitleInput, //this saves the text entered whenever the text is changed
      maxLength: 50,
      decoration: const InputDecoration(
        label: Text('Title'),
      ),
    );
  }
}
