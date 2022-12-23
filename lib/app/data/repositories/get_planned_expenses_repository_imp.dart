import 'package:my_expenses/app/data/data_sources/get_planned_expenses_list_data_source.dart';
import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';
import 'package:my_expenses/app/domain/repositories/get_planned_expenses_list_repository.dart';

class GetPlannedExpensesListRepositoryImp
    implements GetPlannedExpensesListRepository {
  final GetPlannedExpensesListDataSource _getPlannedExpensesListDataSource;

  GetPlannedExpensesListRepositoryImp(this._getPlannedExpensesListDataSource);
  @override
  Future<List<PlannedExpensesEntity>> call() async {
    return await _getPlannedExpensesListDataSource();
  }
}
