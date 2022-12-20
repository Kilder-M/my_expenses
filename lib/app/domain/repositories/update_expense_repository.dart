import 'package:my_expenses/app/domain/entities/expense_entity.dart';

abstract class UpdateExpenseRepository{
  Future<bool> call(ExpenseEntity expenseEntity);
}