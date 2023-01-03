import 'package:get/get.dart';
import 'package:my_expenses/app/domain/entities/expense_entity.dart';
import 'package:my_expenses/app/domain/usecases/get_expenses_list_usecase/get_expenses_list_usecase.dart';

class ExpensesController extends GetxController{
  final _getExpenseListbyId = Get.find<GetExpensesListByIdUsecase>();

  var expensesList = <ExpenseEntity>[].obs;

  Future<List<ExpenseEntity>> getExpenseListById(int id)async{
    return expensesList.value = await _getExpenseListbyId(id);
  }
}