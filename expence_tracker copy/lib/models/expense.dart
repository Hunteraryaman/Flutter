import 'package:uuid/uuid.dart';

const uuid = Uuid(); //this is used to generate a random uniquie id

enum Category { food, work, leisure, travel }

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
}
