import 'package:get/get.dart';
import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';
import 'package:my_expenses/app/domain/usecases/save_planned_expenses_usecase/save_planned_expense_usecase.dart';

class PlannedExpensesFormController extends GetxController {
  final _savePlannedExpensesUsecase = Get.find<SavePlannedExpensesUseCase>();

  PlannedExpensesEntity plannedExpensesEntity = PlannedExpensesEntity(wage: 0,month: DateTime.now());

  Future<bool> savePlannedExpenseLocalDataSource(
      PlannedExpensesEntity plannedExpensesEntity) async {
    return await _savePlannedExpensesUsecase(plannedExpensesEntity);
  }
}
