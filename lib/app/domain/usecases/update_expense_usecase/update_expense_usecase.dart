import 'package:my_expenses/app/domain/entities/expense_entity.dart';

abstract class UpdateExpenseUsecase{
  Future<bool> call(ExpenseEntity expenseEntity);
}