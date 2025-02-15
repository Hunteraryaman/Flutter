import 'package:expence_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  const DatePicker(
      {super.key, required this.presentDatePicker, required this.selectedDate});

  final void Function() presentDatePicker;
  final DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            //!date picker
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  selectedDate == null
                      ? 'No Selected data'
                      : formater.format(selectedDate!),
                  style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .error
                        .withValues(alpha: 0.7),
                  ),
                ),
                // '!' tells dart that the value will never be null
                IconButton(
                  onPressed: presentDatePicker,
                  icon: const Icon(Icons.calendar_month),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
