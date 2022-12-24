import 'package:my_expenses/app/domain/entities/expense_entity.dart';
import 'package:my_expenses/app/domain/repositories/get_expenses_list_repository.dart';
import 'package:my_expenses/app/domain/usecases/get_expenses_list_usecase/get_expenses_list_usecase.dart';

class GetExpensesListByIdUsecaseImp implements GetExpensesListByIdUsecase{
  final GetExpensesListByIdRepository _getExpensesListRepository;

  GetExpensesListByIdUsecaseImp(this._getExpensesListRepository);
  @override
  Future<List<ExpenseEntity>> call(int id) async{
    return await _getExpensesListRepository(id);
  }

}