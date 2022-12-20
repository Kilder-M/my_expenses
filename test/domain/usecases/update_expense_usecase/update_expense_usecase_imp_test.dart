import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_expenses/app/domain/entities/expense_entity.dart';
import 'package:my_expenses/app/domain/usecases/save_expense_usecase/save_expense_usecase_imp.dart';

class MockUpdateExpenseUsecaseImp extends Mock implements UpdateExpenseUsecaseImp {}

void main() {
  final mockUpdateExpenseUsecaseImp = MockUpdateExpenseUsecaseImp();
  group('Testing update expense usecase implement:', () {
    ExpenseEntity expenseEntity = ExpenseEntity(
      id: 1,
      name: 'agua',
      paymentType: 'TED',
      status: 'Em aberto',
      value: 90.0,
      plannedExpensesId: 1,
    );
    test('Should return that expense was updated', () async {
      expenseEntity.value = 100.0;
      when(
        () => mockUpdateExpenseUsecaseImp(expenseEntity),
      ).thenAnswer((invocation) async => true);
      final response = await mockUpdateExpenseUsecaseImp(expenseEntity);

      expect(response, true);
    });

     test('Should return that expense was not updated', () async {
      when(
        () => mockUpdateExpenseUsecaseImp(expenseEntity),
      ).thenAnswer((invocation) async => false);
      final response = await mockUpdateExpenseUsecaseImp(expenseEntity);

      expect(response, false);
    });

    test('Should return the expense correct updated value', () async {
      expenseEntity.value = 100.0;
      when(
        () => mockUpdateExpenseUsecaseImp(expenseEntity),
      ).thenAnswer((invocation) async => false);
      final response = expenseEntity;

      expect(response.value, 100.0);
    });
  });
}
