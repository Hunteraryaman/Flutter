import 'package:expence_tracker/models/expense.dart';

import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 20,
          ),
          child: Column(
            children: [
              Text(expense.title),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    '\$${expense.amount.toStringAsFixed(2)}',
                    //this sets the limit to 2decimal places
                  ),
                  const Spacer(), //this is a widget that takes all the remaining space after the space for the diff widgets have been alocagted
                  Row(
                    children: [
                      Icon(categoryItems[expense.category]),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(expense
                          .formatedDate), //this is getter so no parenthesis
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
