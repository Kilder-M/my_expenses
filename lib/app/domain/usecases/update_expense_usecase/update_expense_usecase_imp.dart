import 'package:my_expenses/app/domain/entities/expense_entity.dart';
import 'package:my_expenses/app/domain/repositories/update_expense_repository.dart';
import 'package:my_expenses/app/domain/usecases/update_expense_usecase/update_expense_usecase.dart';

class UpdateExpenseUsecaseImp implements UpdateExpenseUsecase{
  final UpdateExpenseRepository _updateExpenseRepository;

  UpdateExpenseUsecaseImp(this._updateExpenseRepository);
  @override
  Future<bool> call(ExpenseEntity expenseEntity) async{
    return await _updateExpenseRepository(expenseEntity);
  }

}