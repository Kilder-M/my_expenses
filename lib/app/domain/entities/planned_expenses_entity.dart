import 'package:my_expenses/app/domain/entities/expense_entity.dart';

class PlannedExpensesEntity {
  int? id;
  List<ExpenseEntity> expensesEntityList;
  String month;
  double? amount;
  double wage;
  double? remainder;

  PlannedExpensesEntity({
    required this.id,
    required this.expensesEntityList,
    required this.month,
    this.amount = 0,
    required this.wage,
    this.remainder,
  });

  double get calculateAmount {
    double amountResult = 0.0;
    for (var expensesEntityList in expensesEntityList) {
      amountResult += expensesEntityList.value;
    }
    return amountResult;
  }

  double get calculateRemainder {
    return wage - calculateAmount;
  }
}
