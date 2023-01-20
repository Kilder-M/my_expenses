import 'package:my_expenses/app/core/data/services/databases/sqflite/get_data_base_sqlite_imp.dart';
import 'package:my_expenses/app/data/data_sources/get_expenses_list_data_source.dart';
import 'package:my_expenses/app/data/dtos/expense_dto.dart';
import 'package:my_expenses/app/domain/entities/expense_entity.dart';

class GetExpensesListByIdLocalDataSourceImp implements GetExpensesListByIdDataSource {
  final GetDataBaseSQLiteImp _getDataBaseImp;

  GetExpensesListByIdLocalDataSourceImp(this._getDataBaseImp);
  @override
  Future<List<ExpenseEntity>> call(int id) async {
    final databaseResponse = await _getDataBaseImp.call();
    List<Map<String, dynamic>> queryResponse =
        await databaseResponse.query('expense',where:'planned_expenses_id = ?',whereArgs: [id],orderBy: 'isPayed ASC,value DESC',);
    List<ExpenseDTO> expensesList =
        List.generate(queryResponse.length, (index) {
      var element = queryResponse[index];
      return ExpenseDTO.fromMapLocalDatabase(element);
    });
    return expensesList;
  }
}
