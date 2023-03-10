import 'package:my_expenses/app/core/data/services/databases/sqflite/get_data_base_sqlite_imp.dart';
import 'package:my_expenses/app/data/data_sources/save_planned_expenses_data_source.dart';
import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';

class SavePlannedExpenseLocalDataSourceImp
    implements SavePlannedExpensesDataSource {
  final GetDataBaseSQLiteImp _getDataBaseImp;

  SavePlannedExpenseLocalDataSourceImp(this._getDataBaseImp);
  @override
  Future<bool> call(PlannedExpensesEntity plannedExpensesEntity) async {
    final databaseResponse = await _getDataBaseImp();
    const sql = '''
      INSERT INTO planned_expenses(month,amount,wage,remainder)
      VALUES(?,?,?,?)
    ''';
    var saveResponse = await databaseResponse.rawInsert(sql, [
      plannedExpensesEntity.month.toIso8601String(),
      plannedExpensesEntity.amount,
      plannedExpensesEntity.wage,
      plannedExpensesEntity.remainder,
    ]);
    return saveResponse != 0 ? true : false;
  }
}
