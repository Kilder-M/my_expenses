import 'package:my_expenses/app/domain/entities/expense_entity.dart';
import 'package:my_expenses/app/domain/repositories/get_expenses_list_repository.dart';
import 'package:my_expenses/app/domain/usecases/get_expenses_list_usecase/get_expenses_list_usecase.dart';

class GetExpensesListUsecaseImp implements GetExpensesListUsecase{
  final GetExpensesListRepository _getExpensesListRepository;

  GetExpensesListUsecaseImp(this._getExpensesListRepository);
  @override
  Future<List<ExpenseEntity>> call() async{
    return await _getExpensesListRepository();
  }

}