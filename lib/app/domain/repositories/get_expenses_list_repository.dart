import 'package:my_expenses/app/domain/entities/expense_entity.dart';

abstract class GetExpensesListRepository{
  Future<List<ExpenseEntity>> call();
}