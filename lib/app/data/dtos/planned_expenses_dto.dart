import 'package:my_expenses/app/domain/entities/expense_entity.dart';
import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';

class PlannedExpensesDTO extends PlannedExpensesEntity {
  PlannedExpensesDTO({
    int? id,
    double? amount,
    double? remainder,
    List<ExpenseEntity> expensesEntityList = const [],
    required DateTime month,
    required double wage,
  }) : super(
          id: id,
          month: month,
          amount: amount,
          wage: wage,
          remainder: remainder,
        );


  factory PlannedExpensesDTO.fromMapLocalDatabase(Map<String, dynamic> json) =>
      PlannedExpensesDTO(
        id: json['id'],
        amount: json['amount'],
        remainder: json['remainder'],
        month:  DateTime.parse(json["month"]),
        wage: json['wage'],
      );
}
