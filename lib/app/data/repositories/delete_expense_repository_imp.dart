import 'package:my_expenses/app/domain/entities/expense_entity.dart';
import 'package:my_expenses/app/domain/repositories/delete_expense_repository.dart';

class DeleteExpenseRepositoryImp extends DeleteExpenseRepository{
  @override
  Future<bool> call(ExpenseEntity expenseEntity) {
    // TODO: implement call
    throw UnimplementedError();
  }

}