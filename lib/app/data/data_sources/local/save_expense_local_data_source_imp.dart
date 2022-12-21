import 'package:my_expenses/app/core/data/services/databases/sqflite/get_data_base_imp.dart';
import 'package:my_expenses/app/data/data_sources/save_expense_data_source.dart';
import 'package:my_expenses/app/domain/entities/expense_entity.dart';

class SaveExpanseLocalDataSourceImp implements SaveExpenseDataSource {
  final GetDataBaseImp _getDataBaseImp;

  SaveExpanseLocalDataSourceImp(this._getDataBaseImp);

  @override
  Future<bool> call(ExpenseEntity expenseEntity) async {
    final databaseResponse = await _getDataBaseImp();
    const sql =
        '''INSERT INTO expense(planned_expenses_id,name,value,payment_type,status)
        VALUES(?,?,?,?,?)
        ''';
   var saveResponse =  await databaseResponse.rawInsert(sql, [
      expenseEntity.plannedExpensesId,
      expenseEntity.name,
      expenseEntity.value,
      expenseEntity.paymentType,
      expenseEntity.status,
    ]);
    return saveResponse != 0 ? true : false;
  }
}
