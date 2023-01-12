import 'package:my_expenses/app/domain/entities/expense_entity.dart';

class PlannedExpensesEntity {
  int? id;
  DateTime month;
  double? amount;
  double wage;
  double? remainder;

  PlannedExpensesEntity({
    this.id,
    required this.month,
    this.amount = 0,
    required this.wage,
    this.remainder,
  });

  double calculateAmount(List<ExpenseEntity> expensesEntityList) {
    double amountResult = 0.0;
    for (var expensesEntityList in expensesEntityList) {
      amountResult += expensesEntityList.value;
    }
    return amountResult;
  }

  double  calculateRemainder(List<ExpenseEntity> expensesEntityList) {
    return wage - calculateAmount(expensesEntityList);
  }
}
