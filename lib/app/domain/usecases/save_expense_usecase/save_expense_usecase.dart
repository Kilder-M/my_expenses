
import 'package:my_expenses/app/domain/entities/expense_entity.dart';

abstract class SaveExpenseUsecase{
  Future<bool> call(ExpenseEntity expenseEntity);
}