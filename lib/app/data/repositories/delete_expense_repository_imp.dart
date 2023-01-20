import 'package:my_expenses/app/data/data_sources/delete_expense_data_source.dart';
import 'package:my_expenses/app/domain/entities/expense_entity.dart';
import 'package:my_expenses/app/domain/repositories/delete_expense_repository.dart';

class DeleteExpenseRepositoryImp implements DeleteExpenseRepository{
  final DeleteExpenseDataSource _deleteExpenseDataSource;

  DeleteExpenseRepositoryImp(this._deleteExpenseDataSource);
  @override
  Future<bool> call(ExpenseEntity expenseEntity) async{
    return await _deleteExpenseDataSource(expenseEntity);
  }
}