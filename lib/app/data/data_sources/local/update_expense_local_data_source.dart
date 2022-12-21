import 'package:my_expenses/app/core/data/services/databases/sqflite/get_data_base_imp.dart';
import 'package:my_expenses/app/data/data_sources/update_expense_data_source.dart';
import 'package:my_expenses/app/domain/entities/expense_entity.dart';

class UpdateExpenseLocalDataSource implements UpdateExpenseDataSource {
  final GetDataBaseImp _getDataBaseImp;

  UpdateExpenseLocalDataSource(this._getDataBaseImp);
  @override
  Future<bool> call(ExpenseEntity expenseEntity) async {
    final databaseResponse = await _getDataBaseImp();
    const sql = '''
        UPDATE expense SET name = ?, value = ?, payment_type = ?,status = ? WHERE id = ?
      ''';
    final updateResponse = await databaseResponse.rawUpdate(
      sql,
      [
        expenseEntity.name,
        expenseEntity.value,
        expenseEntity.paymentType,
        expenseEntity.status,
        expenseEntity.id,
      ],
    );
    return updateResponse != 0 ? true : false;
  }
}