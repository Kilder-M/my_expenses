import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_expenses/app/domain/entities/expense_entity.dart';
import 'package:my_expenses/app/domain/usecases/save_expense_usecase/save_expense_usecase_imp.dart';

class MockSaveExpenseUsecaseImp extends Mock implements SaveExpenseUsecaseImp {}

void main() {
  final mockSaveExpenseUsecaseImp = MockSaveExpenseUsecaseImp();
  group('Testing save expense usecase implement:', () {
    ExpenseEntity expenseEntity = ExpenseEntity(
      id: 1,
      name: 'agua',
      paymentType: 'TED',
      status: 'Em aberto',
      value: 90.0,
      plannedExpensesId: 1,
    );
    test('Should return that expense was saved', () async {
      when(
        () => mockSaveExpenseUsecaseImp(expenseEntity),
      ).thenAnswer((invocation) async => true);
      final response = await mockSaveExpenseUsecaseImp(expenseEntity);

      expect(response, true);
    });

     test('Should return that expense was not saved', () async {
      when(
        () => mockSaveExpenseUsecaseImp(expenseEntity),
      ).thenAnswer((invocation) async => false);
      final response = await mockSaveExpenseUsecaseImp(expenseEntity);

      expect(response, false);
    });
  });
}
