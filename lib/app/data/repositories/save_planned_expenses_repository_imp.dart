import 'package:my_expenses/app/data/data_sources/save_planned_expenses_data_source.dart';
import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';
import 'package:my_expenses/app/domain/repositories/save_planned_expenses_repository.dart';

class SavePlannedExpensesRepositoryImp implements SavePlannedExpensesRepository{
  final SavePlannedExpensesDataSource _savePlannedExpenseDataSource;

  SavePlannedExpensesRepositoryImp(this._savePlannedExpenseDataSource);
  @override
  Future<bool> save(PlannedExpensesEntity plannedExpensesEntity) async {
    return await _savePlannedExpenseDataSource(plannedExpensesEntity);
  }

}