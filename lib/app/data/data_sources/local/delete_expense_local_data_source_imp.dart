import 'package:my_expenses/app/core/data/services/databases/sqflite/get_data_base_imp.dart';
import 'package:my_expenses/app/data/data_sources/delete_expense_data_source.dart';
import 'package:my_expenses/app/domain/entities/expense_entity.dart';

class DeleteExpenseLocalDataSourceImp implements DeleteExpenseDataSource{
    final GetDataBaseImp _getDataBaseImp;

  DeleteExpenseLocalDataSourceImp(this._getDataBaseImp);
  @override
  Future<bool> call(ExpenseEntity expenseEntity ) async{
    final databaseResponse = await _getDataBaseImp();
    const sql = '''
      DELETE FROM expense WHERE id = ?
    ''';
    final deleteResponse = await databaseResponse.rawDelete(sql,[expenseEntity.id]);
    return deleteResponse != 0 ? true : false;
  }

}