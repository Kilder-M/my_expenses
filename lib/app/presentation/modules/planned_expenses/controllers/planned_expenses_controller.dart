import 'package:get/get.dart';
import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';
import 'package:my_expenses/app/domain/usecases/get_planned_expenses_usecase/get_planned_expenses_list_usecase.dart';
import 'package:my_expenses/app/domain/usecases/save_planned_expenses_usecase/save_planned_expense_usecase.dart';

class PlannedExpensesController extends GetxController {
  final _savePlannedExpensesUsecase = Get.find<SavePlannedExpensesUseCase>();
  final _getPlannedExpensesListUseCase =
      Get.find<GetPlannedExpensesListUsecase>();
  var plannedExpenseList = <PlannedExpensesEntity>[].obs;

  Future<bool> savePlannedExpenseLocalDataSource(
      PlannedExpensesEntity plannedExpensesEntity) async {
    return await _savePlannedExpensesUsecase(plannedExpensesEntity);
  }

  Future<List<PlannedExpensesEntity>>
      getPlannedExpensesLocalDataSource() async {
    return plannedExpenseList.value = await _getPlannedExpensesListUseCase();
  }


}
