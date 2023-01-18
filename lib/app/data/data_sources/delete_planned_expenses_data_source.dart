import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';

abstract class DeletePlannedExpensesDataSource {
  Future<bool> call(PlannedExpensesEntity plannedExpensesEntity);
}