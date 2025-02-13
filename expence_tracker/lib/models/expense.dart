import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formater = DateFormat
    .yMd(); //this creates a formater object that we can use to format date

const uuid = Uuid(); //this is used to generate a random uniquie id

enum Category { food, work, leisure, travel }

const categoryItems = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
  }) : id = uuid.v4(); //this here generatres a unique id
// initialising with : is called initializer list feature
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formatedDate {
    return formater.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  final Category category;
  final List<Expense> expenses;
//this is created to filter out the expenses that are of the category provided
//this goes throughjh all the expenses and filters out the expenses of the mentioned category
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();
//  : this colon is called initializer list and there we set expenses equal to the filtered expense
//where allows to filter the list
//there we use the function to filter baseed on if that categoury is present
//then we convert the whole value to list

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      //this is a variation of for loop which is perfect to go through all the items of list
      // in tells flutter that we want to go through all the items in the list
      //final can be used as at every iteration a new expense is created and an iteration of expenses is stored in it
      sum += expense.amount;
    }
    return sum;
  }
}
