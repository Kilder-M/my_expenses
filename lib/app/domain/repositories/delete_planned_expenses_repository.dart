import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';

abstract class DeletePlannedExpensesRepository{

  Future<bool> call(PlannedExpensesEntity plannedExpensesEntity);
}