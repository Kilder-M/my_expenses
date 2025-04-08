import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_expenses/app/core/enums/payment_type_enum.dart';
import 'package:my_expenses/app/domain/entities/expense_entity.dart';
import 'package:my_expenses/app/domain/usecases/save_expense_usecase/save_expense_usecase.dart';
import 'package:my_expenses/app/domain/usecases/update_expense_usecase/update_expense_usecase.dart';
import 'package:my_expenses/app/presentation/modules/planned_expenses/controllers/expenses_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class ExpenseFormController extends GetxController {
  final _saveExpanseUsecase = Get.find<SaveExpenseUsecase>();
  final _expenseController = Get.find<ExpensesController>();
  final _updateExpense = Get.find<UpdateExpenseUsecase>();

  ExpenseEntity expenseEntity = ExpenseEntity(
    plannedExpensesId: 0,
    paymentType: 'Money',
    name: '',
    value: 0,
  );

  List<PaymentTypeEnum> paymentypeList = [
    PaymentTypeEnum.money,
    PaymentTypeEnum.pix,
    PaymentTypeEnum.debit,
    PaymentTypeEnum.credit,
  ];

  saveExpenseLocalDataSource(int plannedExpenseId) async {
    expenseEntity.plannedExpensesId = plannedExpenseId;
    await _saveExpanseUsecase(expenseEntity);
    await _expenseController.getExpenseListById(plannedExpenseId);
  }

  updateExpenseLocalDataSource(int plannedExpenseId) async {
    await _updateExpense(expenseEntity);
    await _expenseController.getExpenseListById(plannedExpenseId);
  }

  CurrencyTextInputFormatter currecyFormat = CurrencyTextInputFormatter(
    NumberFormat.compactCurrency(
      locale: 'pt',
      symbol: 'R\$',
    ),
  );

  String getPaymentTypeName(
      BuildContext context, PaymentTypeEnum paymentTypeEnum) {
    switch (paymentTypeEnum) {
      case PaymentTypeEnum.money:
        return AppLocalizations.of(context)!.money;
      case PaymentTypeEnum.pix:
        return AppLocalizations.of(context)!.pix;

      case PaymentTypeEnum.debit:
        return AppLocalizations.of(context)!.debit;

      case PaymentTypeEnum.credit:
        return AppLocalizations.of(context)!.credit;
    }
  }
}
