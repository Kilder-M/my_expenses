import 'package:get/get.dart';
import 'package:my_expenses/app/domain/entities/expense_entity.dart';
import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';
import 'package:my_expenses/app/domain/usecases/delete_expense_usecase/delete_expense_usecase.dart';
import 'package:my_expenses/app/domain/usecases/get_expenses_list_usecase/get_expenses_list_usecase.dart';
import 'package:my_expenses/app/domain/usecases/update_expense_usecase/update_expense_usecase.dart';

class ExpensesController extends GetxController {
  final _getExpenseListbyId = Get.find<GetExpensesListByIdUsecase>();
  final _updateExpense = Get.find<UpdateExpenseUsecase>();
  final _deleteExpense = Get.find<DeleteExpenseUsecase>();

  PlannedExpensesEntity plannedExpenseArgument = Get.arguments;


  var expensesList = <ExpenseEntity>[].obs;
  var payedExpenseLenght = 0.obs;

  getExpenseListById(int id) async {
    var response = expensesList.value = await _getExpenseListbyId(id);
    getPayedExpenseLenght();
    return response;
  }

  deleteExpenseUseCase(ExpenseEntity expenseEntity)async{
    return await _deleteExpense(expenseEntity);
  }

  updateExpenseStatusLocalDataSource(ExpenseEntity expenseEntity) async {
    return await _updateExpense(expenseEntity);
  }

  int getPayedExpenseLenght() {
    return payedExpenseLenght.value = expensesList
        .where((element) => element.isPayed == true)
        .toList()
        .length;
  }
}
