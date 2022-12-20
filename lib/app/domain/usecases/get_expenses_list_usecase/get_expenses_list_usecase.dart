import 'package:my_expenses/app/domain/entities/expense_entity.dart';

abstract class GetExpensesListUsecase {
  Future<List<ExpenseEntity>> call();
}