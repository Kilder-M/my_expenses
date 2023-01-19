import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_expenses/app/domain/entities/expense_entity.dart';
import 'package:my_expenses/app/domain/usecases/get_expenses_list_usecase/get_expenses_list_usecase_imp.dart';

class MockGetExpensesListUsecaseImp extends Mock
    implements GetExpensesListByIdUsecaseImp {}

void main() {
  final getExpensesListUsecaseImp = MockGetExpensesListUsecaseImp();
  group('Testing get expenses list use case implement:', () {
    final expensesList = [
      ExpenseEntity(
        id: 1,
        name: 'Agua',
        paymentType: 'DEB',
        isPayed: false,
        value: 90.0,
        plannedExpensesId: 1,
      ),
      ExpenseEntity(
        id: 2,
        name: 'Luz',
        paymentType: 'DEB',
        isPayed: true,
        value: 190.0,
        plannedExpensesId: 1,
      ),
    ];

    test('Should return a expenses list', () async {
      when(
        () => getExpensesListUsecaseImp(1),
      ).thenAnswer((invocation) async => expensesList);

      final response = await getExpensesListUsecaseImp(1);

      expect(response, isA<List<ExpenseEntity>>());
    });
  });
}
