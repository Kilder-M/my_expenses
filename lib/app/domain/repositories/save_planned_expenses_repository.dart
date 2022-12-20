import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';

abstract class SavePlannedExpensesRepository {
  Future<bool> save(PlannedExpensesEntity plannedExpensesEntity);
}