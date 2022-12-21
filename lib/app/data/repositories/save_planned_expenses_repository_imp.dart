import 'package:my_expenses/app/data/data_sources/local/save_planned_expenses_local_data_source_imp.dart';
import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';
import 'package:my_expenses/app/domain/repositories/save_planned_expenses_repository.dart';

class SavePlannedExpensesRepositoryImp extends SavePlannedExpensesRepository{
  final SavePlannedExpenseLocalDataSourceImp _savePlannedExpenseLocalDataSource;

  SavePlannedExpensesRepositoryImp(this._savePlannedExpenseLocalDataSource);
  @override
  Future<bool> save(PlannedExpensesEntity plannedExpensesEntity) async {
    return await _savePlannedExpenseLocalDataSource(plannedExpensesEntity);
  }

}