import 'package:expence_tracker/main.dart';
import 'package:expence_tracker/widgets/chart/chart.dart';
import 'package:expence_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expence_tracker/models/expense.dart';
import 'package:expence_tracker/widgets/new_expence.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpencesState();
  }
}

class _ExpencesState extends State<Expenses> {
  final List<Expense> _registerExpences = [
    Expense(
        title: 'Flutter course',
        category: Category.work,
        amount: 19.99,
        date: DateTime.now()),
    Expense(
        title: 'Cinema',
        category: Category.leisure,
        amount: 15.69,
        date: DateTime.now()),
    Expense(
        title: 'Dinner',
        category: Category.food,
        amount: 29.99,
        date: DateTime.now()),
  ];

  void _openAddExpenceOverlay() {
    showModalBottomSheet(
      isScrollControlled: true, //this makes it fullscreen
      context: context,
      builder: (ctx) => NewExpence(
        onAddExpense: _addExpense,
      ),
    );
    //context is a a kind of metadata //it holds the position of the widget
    //ctx is context of modal bottom
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registerExpences.add(expense);
    });
  }

  void _removeExpence(Expense expense) {
    final index = _registerExpences.indexOf(expense);
    setState(() {
      _registerExpences.remove(expense);
    });
    //this is a specisal object ehich is used to show or hide certain ui elements
    //of is its method
    //snackbar is a info message shown on screen
    ScaffoldMessenger.of(context).clearSnackBars();
    //this removes the previous snack bars if any
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expence deleted.'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          // onPressed: () => _addExpense(expense),
          onPressed: () {
            setState(() {
              _registerExpences.insert(index, expense);
              //this adds at a specific position
            });
          },
        ),
        // shape:  BeveledRectangleBorder(borderRadius: BorderRadius.all(30 as Radius)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text(
        'No Expence in the list please add some',
      ),
    );

    if (_registerExpences.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registerExpences,
        onRemoveExpence: _removeExpence,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expence Tracker',
        //   style: TextStyle(
        //     //this is for the title
        //     fontWeight: FontWeight.bold,
        //     fontSize: 20,
        //     color: kDarkColorScheme.scrim,
        //   ),
        // 
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenceOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registerExpences),
          //this here is using the charrt widget that was created by the teacher
          // i pass _registerExpences here to pass all the recorded expences

          Expanded(
            child: mainContent,
          ),
          //expanded restricts the size to the size of the parent column
          //this displays a column which makes it a column inside a column
          //flutter doesn't know how to give space to the child column or how to ristrict it
        ],
      ),
    );
  }
}
