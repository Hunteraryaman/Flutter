import 'package:flutter/material.dart';

class Amount extends StatelessWidget {
  Amount({super.key, required this.textEditingController});

  TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      // maxLength: 20,//this is not nescessary
      decoration: const InputDecoration(
        prefixText:
            '\$ ', //trhis adds a doller sign in front of the amount entered
        label: Text('Amount'),
      ),
      keyboardType: TextInputType.number,
    );
  }
}
