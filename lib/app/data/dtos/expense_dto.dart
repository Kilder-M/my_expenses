import 'package:my_expenses/app/domain/entities/expense_entity.dart';

class ExpenseDTO extends ExpenseEntity {
  ExpenseDTO({
    int? id,
    required int plannedExpensesId,
    required String name,
    required double value,
    required String paymentType,
    required bool isPayed,
  }) : super(
            id: id,
            plannedExpensesId: plannedExpensesId,
            name: name,
            paymentType: paymentType,
            isPayed: isPayed,
            value: value);

  factory ExpenseDTO.fromMapLocalDatabase(Map<String, dynamic> json) => ExpenseDTO(
        id: json['id'],
        plannedExpensesId: json['planned_expenses_id'],
        name: json['name'],
        value: json['value'],
        paymentType: json['payment_type'],
        isPayed: json['status'],
      );

  Map<String, dynamic> toMapLocalDatabase() => {
        'id': id,
        'planned_expenses_id': plannedExpensesId,
        'name': name,
        'value': value,
        'status': isPayed,
      };
}
