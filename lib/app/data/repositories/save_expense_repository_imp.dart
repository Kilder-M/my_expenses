import 'package:my_expenses/app/data/data_sources/save_expense_data_source.dart';
import 'package:my_expenses/app/domain/entities/expense_entity.dart';
import 'package:my_expenses/app/domain/repositories/save_expense_repository.dart';

class SaveExpenseRepositoryImp extends SaveExpenseRepository{
  final SaveExpenseDataSource _saveExpenseDataSource;

  SaveExpenseRepositoryImp(this._saveExpenseDataSource);
  @override
  Future<bool> save(ExpenseEntity expenseEntity) async{
    return await _saveExpenseDataSource(expenseEntity);
  }

}