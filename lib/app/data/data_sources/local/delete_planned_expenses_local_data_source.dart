import 'package:my_expenses/app/core/data/services/databases/sqflite/get_data_base_sqlite_imp.dart';
import 'package:my_expenses/app/data/data_sources/delete_planned_expenses_data_source.dart';
import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';

class DeletePlannedExpensesLocalDataSourceImp
    implements DeletePlannedExpensesDataSource {
  final GetDataBaseSQLiteImp _getDataBaseImp;

  DeletePlannedExpensesLocalDataSourceImp(this._getDataBaseImp);

  @override
  Future<bool> call(PlannedExpensesEntity plannedExpensesEntity) async {
    final databaseResponse = await _getDataBaseImp();
    const deletePlannedExpensesSql = '''
      DELETE FROM planned_expenses WHERE id = ?
    ''';
    const deleteExpensesSql = '''
      DELETE FROM expense WHERE planned_expenses_id = ?
    ''';
    int deletePlannedExpensesResponse = await databaseResponse
        .rawDelete(deletePlannedExpensesSql, [plannedExpensesEntity.id]);
    int deleteExpensesResponse = await databaseResponse
        .rawDelete(deleteExpensesSql, [plannedExpensesEntity.id]);
    return deletePlannedExpensesResponse != 0 && deleteExpensesResponse != 0
        ? true
        : false;
  }
}
