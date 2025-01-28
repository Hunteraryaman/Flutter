  import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewExpence extends StatefulWidget {
  const NewExpence({super.key});

  @override
  State<NewExpence> createState() {
    return _NewExpenceState();
  }
}

class _NewExpenceState extends State<NewExpence> {
  //this was used to store the entered text in a variable
  // var _enteredTitle = '';
  // void _saveTitleInput(String inputTitle) {
  //   _enteredTitle = inputTitle;
  // }

  final _titleControler = TextEditingController();
  final _amountControler = TextEditingController();

  void _presentDatePicker() {
    final now = DateTime.now();
    // final firstDate=DateTime(now.year-1,now.date);
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
      initialDate: now,
    );
  }

  @override
  void dispose() {
    _titleControler.dispose();
    // _amountControler.dispose();
    //this is used to delete the controler to free the memory
    //as it does not automatically close we need to close it manually by disposing it
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleControler, //this automatically stores the text
            // onChanged:
            // _saveTitleInput, //this saves the text entered whenever the text is changed
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
            // keyboardType: TextInputType
            // .emailAddress, //this opens a keyboard optimised for email
          ),
          // const Spacer(),
          // const Expanded(
          //   child: Row(
          //     children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountControler,
                  // maxLength: 20,//this is not nescessary
                  decoration: const InputDecoration(
                    prefixText:
                        '\$ ', //trhis adds a doller sign in front of the amount entered
                    label: Text('Amount'),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              // const Spacer(),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Selected data'),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              )
            ],
          ),
          //     ],
          //   ),
          // ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  print(_titleControler.text);
                  print(_amountControler.text);
                },
                child: const Text('Save'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context); //this closes the modal overlay
                    //this uses the context value from build to remove the overlay
                  },
                  child: const Text('Cancel'))
            ],
          )
        ],
      ),
    );
  }
}
