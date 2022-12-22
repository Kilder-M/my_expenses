import 'package:my_expenses/app/data/data_sources/local/update_expense_local_data_source_imp.dart';
import 'package:my_expenses/app/domain/entities/expense_entity.dart';
import 'package:my_expenses/app/domain/repositories/update_expense_repository.dart';

class UpdateExpenseRepositoryImp implements UpdateExpenseRepository {
  final UpdateExpenseLocalDataSourceImp _updateExpenseLocalDataSource;

  UpdateExpenseRepositoryImp(this._updateExpenseLocalDataSource);
  @override
  Future<bool> call(ExpenseEntity expenseEntity) async {
    return await _updateExpenseLocalDataSource(expenseEntity);
  }
}
