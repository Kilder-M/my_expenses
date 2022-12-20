import 'package:my_expenses/app/data/data_sources/get_expenses_list_data_source.dart';
import 'package:my_expenses/app/domain/entities/expense_entity.dart';
import 'package:my_expenses/app/domain/repositories/get_expenses_list_repository.dart';

class GetExpensesListRepositoryImp extends GetExpensesListRepository{
  final GetExpensesListDataSource _getExpensesListDataSource;

  GetExpensesListRepositoryImp(this._getExpensesListDataSource);
  @override
  Future<List<ExpenseEntity>> call() async {
   return await _getExpensesListDataSource();
  }

}