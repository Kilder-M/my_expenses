import 'package:flutter_test/flutter_test.dart';
import 'package:my_expenses/app/domain/entities/expense_entity.dart';

void main() {
  group('Testing expense entity:', () {
    ExpenseEntity expenseEntity = ExpenseEntity(
      id: 1,
      name: 'agua',
      paymentType: 'TED',
      isPayed: false,
      value: 90.0,
      plannedExpensesId: 1,
    );
    test('should return a expense not null', () {
      expect(expenseEntity, isNotNull);
    });
    test('should return the correct id', () {
      expect(expenseEntity.id, 1);
    });
    test('should return the correct value', () {
      expect(expenseEntity.value, 90.0);
    });
  });
}
