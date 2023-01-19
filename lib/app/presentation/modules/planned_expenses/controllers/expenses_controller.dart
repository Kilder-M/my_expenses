import 'package:get/get.dart';
import 'package:my_expenses/app/domain/entities/expense_entity.dart';
import 'package:my_expenses/app/domain/usecases/get_expenses_list_usecase/get_expenses_list_usecase.dart';
import 'package:my_expenses/app/domain/usecases/update_expense_usecase/update_expense_usecase.dart';

class ExpensesController extends GetxController{
  final _getExpenseListbyId = Get.find<GetExpensesListByIdUsecase>();
  final _updateExpense = Get.find<UpdateExpenseUsecase>();

  var expensesList = <ExpenseEntity>[].obs;

  Future<List<ExpenseEntity>> getExpenseListById(int id)async{
    return expensesList.value = await _getExpenseListbyId(id);
  }

  Future<bool> updateExpenseStatusToPayedLocalDataSource(ExpenseEntity expenseEntity)async{
    expenseEntity.isPayed = !expenseEntity.isPayed;
    var response = await _updateExpense(expenseEntity);
    return response;
  }
}