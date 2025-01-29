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
      context: context,
      builder: (ctx) => const NewExpence(),
    );
    //context is a a kind of metadata //it holds the position of the widget
    //ctx is context of modal bottom
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expence Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenceOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          const Text('chart'),
          Expanded(
            child: ExpensesList(expenses: _registerExpences),
          ),
          //expanded restricts the size to the size of the parent column
          //this displays a column which makes it a column inside a column
          //flutter doesn't know how to give space to the child column or how to ristrict it
        ],
      ),
    );
  }
}
