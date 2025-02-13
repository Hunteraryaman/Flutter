import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.fill,
  });

  final double fill;

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox(
          //this does not take a fixed height in pixcels but a height factor instead
          heightFactor: fill,
          // this is a no between 0 and 1
          //1 means it takes 100% of the available height
          //0 means it takes 0%
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
              color: isDarkMode
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context)
                      .colorScheme
                      .primary
                      .withValues(alpha: 0.65),
            ),
          ),
        ),
      ),
    );
  }
}
