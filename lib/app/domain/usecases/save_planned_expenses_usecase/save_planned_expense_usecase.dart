import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';

abstract class SavePlannedExpensesUseCase {
  Future<bool> call(PlannedExpensesEntity plannedExpensesEntity);
}