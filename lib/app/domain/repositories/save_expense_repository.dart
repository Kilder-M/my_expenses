import 'package:my_expenses/app/domain/entities/expense_entity.dart';

abstract class SaveExpenseRepository{
  Future<bool> save(ExpenseEntity expenseEntity);
}