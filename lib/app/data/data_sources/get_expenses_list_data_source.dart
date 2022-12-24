import 'package:my_expenses/app/domain/entities/expense_entity.dart';

abstract class GetExpensesListByIdDataSource {
  Future<List<ExpenseEntity>> call(int id);
}