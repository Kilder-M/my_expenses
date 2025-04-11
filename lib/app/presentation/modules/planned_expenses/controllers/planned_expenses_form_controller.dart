import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';
import 'package:my_expenses/app/domain/usecases/save_planned_expenses_usecase/save_planned_expense_usecase.dart';
import 'package:my_expenses/app/presentation/base/base_controllers/me_base_controller.dart';
import 'package:my_expenses/app/presentation/modules/planned_expenses/controllers/planned_expenses_controller.dart';

class PlannedExpensesFormController extends MeBaseController {

  //usecases instances
  final _savePlannedExpensesUsecase = Get.find<SavePlannedExpensesUseCase>();
  final _plannedExpensesController = Get.find<PlannedExpensesController>();
  final dateTextFormFieldController = TextEditingController();
  final valueTextFormFieldController = TextEditingController();
  //usecases instances


  CurrencyTextInputFormatter currecyFormat =
      CurrencyTextInputFormatter.currency(
    maxValue: 10000000000000,
  );

  PlannedExpensesEntity plannedExpensesEntity =
      PlannedExpensesEntity(wage: 0, month: DateTime.now());

  savePlannedExpenseLocalDataSource(
      PlannedExpensesEntity plannedExpensesEntity) async {
    await _savePlannedExpensesUsecase(plannedExpensesEntity);
    _plannedExpensesController.getPlannedExpensesLocalDataSource();
  }
}
