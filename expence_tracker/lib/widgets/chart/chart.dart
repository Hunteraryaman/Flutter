import 'package:flutter/material.dart';

import 'package:expence_tracker/widgets/chart/chart_bar.dart';
import 'package:expence_tracker/models/expense.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return [
      //here this list is being filled with 4 diff lists with all lists having diff category as their filter
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.work),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;
//this here gets the max no of total expense of the 4 diff lists
    for (final bucket in buckets) {
      //bucket here is the single bucket from the list of buckets
      //so it is checked if the max is greater or not if not then it is replaced
      if (bucket.totalExpenses > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpenses;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
        //this returns true if it is in dark more and false otherwise
//this is used to get some info about the environment in which your app is running
//this is used here to find what the brightness of the platform is
//if it is running in dark or light mode
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        //this is for the background of the chart
        borderRadius: BorderRadius.circular(8),
        //this is for the radius of the background
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            //this makes it such that the column takes the full space left by the container after padding and margin

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets) // alternative to map()
                  //this format can be used when you are inside of a place where a list of widgets is required
                  //as we are not using curly braces here
                  //this directly outputs or creates the widiget and provides it to row
                  ChartBar(
                    //totalExpenses used from the object ExpenceBucket
                    //max is getter from this class
                    fill: bucket.totalExpenses == 0
                        ? 0
                        : bucket.totalExpenses / maxTotalExpense,
                  )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        categoryItems[bucket.category],
                        //this sets the icons
                        color: isDarkMode
                            ? Theme.of(context)
                                .colorScheme
                                .secondary //dark mode
                            : Theme.of(context) //light mode
                                .colorScheme
                                .primary
                                .withValues(alpha: 0.7),
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
