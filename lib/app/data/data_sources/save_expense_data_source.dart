import 'package:my_expenses/app/domain/entities/expense_entity.dart';

abstract class SaveExpenseDataSource{
  Future<bool> call(ExpenseEntity expenseEntity);
}