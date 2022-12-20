import 'package:my_expenses/app/core/data/services/databases/sqflite/get_data_base_imp.dart';
import 'package:my_expenses/app/data/data_sources/get_expenses_list_data_source.dart';
import 'package:my_expenses/app/domain/entities/expense_entity.dart';

class GetExpensesListDataSourceLocal implements GetExpensesListDataSource{
  final GetDataBaseImp _getDataBaseImp;

  GetExpensesListDataSourceLocal(this._getDataBaseImp);
  @override
  Future<List<ExpenseEntity>> call() async{
    final databaseResponse = await _getDataBaseImp.call();
    databaseResponse.
  }

}