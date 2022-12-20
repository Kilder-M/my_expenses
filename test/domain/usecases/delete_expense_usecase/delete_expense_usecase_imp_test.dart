import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_expenses/app/domain/entities/expense_entity.dart';
import 'package:my_expenses/app/domain/usecases/delete_expense_usecase/delete_expense_usecase_imp.dart';

class MockDeleteExpenseUsecaseImp extends Mock implements DeleteExpenseUsecaseImp {}

void main() {
  final mockDeleteExpenseUsecaseImp = MockDeleteExpenseUsecaseImp();
  group('Testing delete expense usecase implement:', () {
    ExpenseEntity expenseEntity = ExpenseEntity(
      id: 1,
      name: 'agua',
      paymentType: 'TED',
      status: 'Em aberto',
      value: 90.0,
      plannedExpensesId: 1,
    );
    test('Should return that expense was deleted', () async {
      when(
        () => mockDeleteExpenseUsecaseImp(expenseEntity),
      ).thenAnswer((invocation) async => true);
      final response = await mockDeleteExpenseUsecaseImp(expenseEntity);

      expect(response, true);
    });

     test('Should return that expense was not deleted', () async {
      when(
        () => mockDeleteExpenseUsecaseImp(expenseEntity),
      ).thenAnswer((invocation) async => false);
      final response = await mockDeleteExpenseUsecaseImp(expenseEntity);

      expect(response, false);
    });
  });
}
