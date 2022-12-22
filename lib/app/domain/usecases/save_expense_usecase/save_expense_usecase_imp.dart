import 'package:my_expenses/app/domain/entities/expense_entity.dart';
import 'package:my_expenses/app/domain/repositories/save_expense_repository.dart';
import 'package:my_expenses/app/domain/usecases/save_expense_usecase/save_expense_usecase.dart';

class SaveExpenseUsecaseImp implements SaveExpenseUsecase{
  final SaveExpenseRepository _saveExpenseRepository;

  SaveExpenseUsecaseImp(this._saveExpenseRepository);

  @override
  Future<bool> call(ExpenseEntity expenseEntity) async{
    return await _saveExpenseRepository.save(expenseEntity);
  }
}