import 'package:my_expenses/app/domain/entities/expense_entity.dart';

abstract class UpdateExpenseDataSource{
  Future<bool> call(ExpenseEntity expenseEntity);
}