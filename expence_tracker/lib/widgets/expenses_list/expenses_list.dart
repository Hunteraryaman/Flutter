import 'package:expence_tracker/models/expense.dart';
import 'package:expence_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //this helps improve performence if the list is very long
      //this builder subclass makes it so that the list is rendered only when it is deemed necessary to be created like at the time it would be dislpayed
      itemCount: expenses.length,
      // itemBuilder: (ctx, index) => Text(expences[index].title),
      itemBuilder: (ctx, index) => ExpensesItem(expense: expenses[index]),
      //this takes an function as an input and we create a arrow function here to display the text the text is displayed for the no of index that the function has
    );
  }
}
