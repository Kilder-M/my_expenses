import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:get/get.dart';
import 'package:my_expenses/app/core/enums/payment_type_enum.dart';
import 'package:my_expenses/app/domain/entities/expense_entity.dart';
import 'package:my_expenses/app/domain/usecases/save_expense_usecase/save_expense_usecase.dart';
import 'package:my_expenses/app/domain/usecases/update_expense_usecase/update_expense_usecase.dart';
import 'package:my_expenses/app/presentation/modules/planned_expenses/controllers/expenses_controller.dart';

class ExpenseFormController extends GetxController {
  final _saveExpanseUsecase = Get.find<SaveExpenseUsecase>();
  final _expenseController = Get.find<ExpensesController>();
  final _updateExpense = Get.find<UpdateExpenseUsecase>();

  ExpenseEntity expenseEntity = ExpenseEntity(
    plannedExpensesId: 0,
    paymentType: PaymentTypeEnum.dinheiro.paymentTypeName,
    name: '',
    value: 0,
  );

  List<PaymentTypeEnum> paymentypeList = [
    PaymentTypeEnum.dinheiro,
    PaymentTypeEnum.pix,
    PaymentTypeEnum.debito,
    PaymentTypeEnum.credito,
    PaymentTypeEnum.ted,
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

  CurrencyTextInputFormatter  currecyFormat = CurrencyTextInputFormatter(
        locale: 'pt',
        symbol: 'R\$',
      );
}
