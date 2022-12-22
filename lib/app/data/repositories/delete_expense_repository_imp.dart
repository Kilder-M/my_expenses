import 'package:my_expenses/app/data/data_sources/local/delete_expense_local_data_source_imp.dart';
import 'package:my_expenses/app/domain/entities/expense_entity.dart';
import 'package:my_expenses/app/domain/repositories/delete_expense_repository.dart';

class DeleteExpenseRepositoryImp implements DeleteExpenseRepository{
  final DeleteExpenseLocalDataSourceImp _deleteExpenseLocalDataSource;

  DeleteExpenseRepositoryImp(this._deleteExpenseLocalDataSource);
  @override
  Future<bool> call(ExpenseEntity expenseEntity) async{
    return await _deleteExpenseLocalDataSource(expenseEntity);
  }
}