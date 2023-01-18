import 'package:get/get.dart';
import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';
import 'package:my_expenses/app/domain/usecases/delete_expense_usecase/delete_planned_expenses_usecase/delete_planned_expenses_usecase.dart';
import 'package:my_expenses/app/domain/usecases/get_planned_expenses_usecase/get_planned_expenses_list_usecase.dart';
import 'package:my_expenses/app/domain/usecases/save_planned_expenses_usecase/save_planned_expense_usecase.dart';

class PlannedExpensesController extends GetxController {
  final _savePlannedExpensesUsecase = Get.find<SavePlannedExpensesUseCase>();
  final _deletePlannedExpensesUsecase =
      Get.find<DeletePlannedExpensesUsecase>();
  final _getPlannedExpensesListUseCase =
      Get.find<GetPlannedExpensesListUsecase>();
  var plannedExpenseList = <PlannedExpensesEntity>[].obs;

  Future<List<PlannedExpensesEntity>>
      getPlannedExpensesLocalDataSource() async {
    return plannedExpenseList.value = await _getPlannedExpensesListUseCase();
  }

  Future<bool> savePlannedExpenseLocalDataSource(
      PlannedExpensesEntity plannedExpensesEntity) async {
    return await _savePlannedExpensesUsecase(plannedExpensesEntity);
  }

  Future<bool> deletePlannedExpensesLocalDataSource(
      PlannedExpensesEntity plannedExpensesEntity) async {
    try {
      bool response =
          await _deletePlannedExpensesUsecase(plannedExpensesEntity);
      await getPlannedExpensesLocalDataSource();
      return response;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
