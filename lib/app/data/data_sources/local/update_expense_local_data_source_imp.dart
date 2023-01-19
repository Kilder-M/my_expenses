import 'package:my_expenses/app/core/data/services/databases/sqflite/get_data_base_sqlite_imp.dart';
import 'package:my_expenses/app/data/data_sources/update_expense_data_source.dart';
import 'package:my_expenses/app/domain/entities/expense_entity.dart';

class UpdateExpenseLocalDataSourceImp implements UpdateExpenseDataSource {
  final GetDataBaseSQLiteImp _getDataBaseImp;

  UpdateExpenseLocalDataSourceImp(this._getDataBaseImp);
  @override
  Future<bool> call(ExpenseEntity expenseEntity) async {
    final databaseResponse = await _getDataBaseImp();
    const sql = '''
        UPDATE expense SET name = ?, value = ?, payment_type = ?,isPayed = ? WHERE id = ?
      ''';
    final updateResponse = await databaseResponse.rawUpdate(
      sql,
      [
        expenseEntity.name,
        expenseEntity.value,
        expenseEntity.paymentType,
        expenseEntity.isPayed ? 1 : 0,
        expenseEntity.id,
      ],
    );
    return updateResponse != 0 ? true : false;
  }
}