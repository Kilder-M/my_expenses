import 'package:my_expenses/app/domain/entities/expense_entity.dart';

abstract class GetExpensesListDataSource {
  Future<List<ExpenseEntity>> call();
}