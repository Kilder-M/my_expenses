import 'package:my_expenses/app/core/data/services/databases/sqflite/get_data_base_sqlite_imp.dart';
import 'package:my_expenses/app/data/data_sources/get_planned_expenses_list_data_source.dart';
import 'package:my_expenses/app/data/dtos/planned_expenses_dto.dart';
import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';

class GetPlannedExpensesListLocalDataSourceImp
    implements GetPlannedExpensesListDataSource {
  final GetDataBaseSQLiteImp _getDataBaseImp;

  GetPlannedExpensesListLocalDataSourceImp(this._getDataBaseImp);
  @override
  Future<List<PlannedExpensesEntity>> call() async {
    final databaseResponse = await _getDataBaseImp();
    List<Map<String, dynamic>> queryResponse =
        await databaseResponse.rawQuery('SELECT * FROM planned_expenses WHERE month LIKE "${DateTime.now().year.toString()}%" ORDER BY month DESC');
    List<PlannedExpensesDTO> plannedExpensesList =
        List.generate(queryResponse.length, (index) {
      var element = queryResponse[index];
      return PlannedExpensesDTO.fromMapLocalDatabase(element);
    });
    return plannedExpensesList;
  }
}
