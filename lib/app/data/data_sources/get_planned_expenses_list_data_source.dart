import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';

abstract class GetPlannedExpensesListDataSource {
  Future<List<PlannedExpensesEntity>> call();
}