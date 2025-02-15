import 'dart:io';

import 'package:expence_tracker/models/expense.dart';
import 'package:expence_tracker/widgets/modalview/amount.dart';
import 'package:expence_tracker/widgets/modalview/cancel_save.dart';
import 'package:expence_tracker/widgets/modalview/date_picker.dart';
import 'package:expence_tracker/widgets/modalview/title.dart';
import 'package:flutter/cupertino.dart';

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
  DateTime? _selectedDate = DateTime.now();
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

  void _showDialog() {
    if (Platform.isIOS) //this is used to check if the platform is ios or not
    {
      showCupertinoDialog(
        //!this is used to show a ios styled dialog box
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: const Text('Invalid input'),
          content: const Text(
            'Please make sure all items are entered',
          ),
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
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text(
            'Please make sure all items are entered',
          ),
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
    }
  }

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
      _showDialog();
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
    _amountControler.dispose();
    //this is used to delete the controler to free the memory
    //as it does not automatically close we need to close it manually by disposing it
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //from this we can get the amount of space that is taken by the keyboard

    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    //this is a objecdt that contains extarar info about ui elements that might be overlapping certain elements of the screen
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return SizedBox(
          height: double.infinity,
          // width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
              //this makes sure that the padding is added to the bottom if the keyboard is open and hence the modal overlay is not hidden by the keyboard and it shifts upwards
              //this 48 is to manage the spacing in the top
              child: Column(
                children: [
                  if (constraints.maxWidth > 600) // ! first row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: TitleText(
                                textEditingController: _titleControler)),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                            child: Amount(
                                textEditingController: _amountControler)),
                      ],
                    )
                  else
                    TitleText(textEditingController: _titleControler),
                  // const Spacer(),
                  // const Expanded(
                  //   child: Row(
                  //     children: [
                  if (constraints.maxWidth > 600) // ! second row
                    Row(
                      children: [
                        DropdownButton(
                          //!dropdown
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
                                  child: Text(
                                    category.name.toUpperCase(),
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                    // .copyWith(
                                    // color:
                                    // const Color.fromARGB(122, 254, 254, 254),
                                    // Theme.of(context).colorScheme.error.withValues(alpha: 0.7),
                                    //colorScheme.onSurface,
                                    // ),
                                  ),
                                  //name gives the string value of the category enum
                                ),
                              )
                              //to list then converts the map of dropdownmenu items into a list
                              .toList(),
                          onChanged: (value) {
                            if (value == null) {
                              return;
                              //this returns or exits from the dropdown
                              //this is if the user didnt select anything
                            }
                            setState(
                              () {
                                _selectedCategory = value;
                              },
                            );
                          },
                        ),
                        const Spacer(),
                        DatePicker(
                            presentDatePicker: _presentDatePicker,
                            selectedDate: _selectedDate),
                      ],
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                            child: Amount(
                                textEditingController: _amountControler)),
                        //     // const Spacer(),
                        const SizedBox(
                          width: 16,
                        ),

                        DatePicker(
                            presentDatePicker: _presentDatePicker,
                            selectedDate: _selectedDate),
                      ],
                    ),
                  // ],
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),

                  if (constraints.maxWidth > 600) //!third row
                    CancelSave(submitExpenceData: _submitExpenceData)
                  else
                    Row(
                      children: [
                        DropdownButton(
                            //!dropdown
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
                                    child: Text(
                                      category.name.toUpperCase(),
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                      // .copyWith(
                                      // color:
                                      // const Color.fromARGB(122, 254, 254, 254),
                                      // Theme.of(context).colorScheme.error.withValues(alpha: 0.7),
                                      //colorScheme.onSurface,
                                      // ),
                                    ),
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
                        Expanded(
                            child: CancelSave(
                                submitExpenceData: _submitExpenceData)),
                      ],
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
