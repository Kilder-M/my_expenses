import 'package:my_expenses/app/data/data_sources/delete_planned_expenses_data_source.dart';
import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';
import 'package:my_expenses/app/domain/repositories/delete_planned_expenses_repository.dart';

 class DeletePlannedExpensesRepositoryImp implements DeletePlannedExpensesRepository{
  final DeletePlannedExpensesDataSource _deletePlannedExpensesDataSource;

  DeletePlannedExpensesRepositoryImp(this._deletePlannedExpensesDataSource);

  @override
  Future<bool> call(PlannedExpensesEntity plannedExpensesEntity) async{
   return await _deletePlannedExpensesDataSource(plannedExpensesEntity);
  }
}