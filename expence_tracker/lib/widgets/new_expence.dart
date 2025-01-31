import 'package:expence_tracker/models/expense.dart';

import 'package:flutter/material.dart';

class NewExpence extends StatefulWidget {
  const NewExpence({super.key, required this.onAddExpense});

  final void Function(Expense expence) onAddExpense;
  @override
  State<NewExpence> createState() {
    return _NewExpenceState();
  }
}

final List<Expense> registerExpences = [];

class _NewExpenceState extends State<NewExpence> {
  //this was used to store the entered text in a variable
  // var _enteredTitle = '';
  // void _saveTitleInput(String inputTitle) {
  //   _enteredTitle = inputTitle;
  // }

  final _titleControler = TextEditingController();
  final _amountControler = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  void _presentDatePicker() async {
    //async is used for future values
    final now = DateTime.now();
    // final firstDate=DateTime(now.year-1,now.date);
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      //this yealds a future object
      //awaits says to wait for value before storing
      //the next line will only be executed once the value is available
      context: context,
      firstDate: firstDate,
      lastDate: now,
      initialDate: now,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }
  //   showDatePicker(
  //     context: context,
  //     firstDate: firstDate,
  //     lastDate: now,
  //     initialDate: now,
  //   ).then(
  //     (value) {},
  //   );
  // }

  void _submitExpenceData() {
    final enteredAmount = double.tryParse(_amountControler.text);
    //this returns null if it is not able to convert the sting into double`
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    //this is used to determin if value is valid or not
    // we use this to check and then give the value needed to be stored like true or false
    if (_titleControler.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      //show error
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text('Please make sure all items are entered'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                //ctx is used as we want to close the dialog and henc3e provide its context
              },
              child: const Text('Okay'),
            )
          ],
        ),
      );
      return;
    }

    widget.onAddExpense(
      Expense(
        title: _titleControler.text,
        category: _selectedCategory,
        amount: enteredAmount,
        date: _selectedDate!,
      ),
    );
    Navigator.pop(context);

    // setState(() {
    //   registerExpences.add(
    //     Expense(
    //       title: _titleControler.text,
    //       category: _selectedCategory,
    //       amount: enteredAmount,
    //       date: _selectedDate!,
    //     ),
    //   );
    // });
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
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
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
                    Text(_selectedDate == null
                        ? 'No Selected data'
                        : formater.format(_selectedDate!)),
                    // ! tells dart that the value will never be null
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
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      //this values property gives a list of all the values that make up thghe enum
                      .map(
                        //map is used to transform it from enum to dropdown menuitem
                        //this takes the category item and retursns the dropdown menuitem
                        (category) => DropdownMenuItem(
                          //child defines what will be shown on the screen
                          //value is used to store the selected value it is only stored internally
                          value: category,
                          child: Text(category.name.toUpperCase()),
                          //name gives the string value of the category enum
                        ),
                      )
                      //to list then converts the map of dropdownmenu items into a list
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                      //this is if the user didnt select anything
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context); //this closes the modal overlay
                    //this uses the context value from build to remove the overlay
                  },
                  child: const Text('Cancel')),
              ElevatedButton(
                onPressed: _submitExpenceData,
                child: const Text('Save'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
