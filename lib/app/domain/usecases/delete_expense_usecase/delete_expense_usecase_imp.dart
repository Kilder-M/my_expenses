
import 'package:my_expenses/app/domain/entities/expense_entity.dart';
import 'package:my_expenses/app/domain/repositories/delete_expense_repository.dart';
import 'package:my_expenses/app/domain/usecases/delete_expense_usecase/delete_expense_usecase.dart';

class DeleteExpenseUsecaseImp implements DeleteExpenseUsecase {
  final DeleteExpenseRepository _deleteExpenseRepository;

  DeleteExpenseUsecaseImp(this._deleteExpenseRepository);
  
  @override
  Future<bool> call(ExpenseEntity expenseEntity) async{
    return await _deleteExpenseRepository(expenseEntity);
  }
  
  
}
