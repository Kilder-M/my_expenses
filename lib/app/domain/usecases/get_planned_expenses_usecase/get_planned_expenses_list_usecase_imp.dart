import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';
import 'package:my_expenses/app/domain/repositories/get_planned_expenses_list_repository.dart';
import 'package:my_expenses/app/domain/usecases/get_planned_expenses_usecase/get_planned_expenses_list_usecase.dart';

class GetPlannedExpensesListUsecaseImp implements GetPlannedExpensesListUsecase {
  final GetPlannedExpensesListRepository _getPlannedExpensesListRepository;

  GetPlannedExpensesListUsecaseImp(this._getPlannedExpensesListRepository);
  @override
  Future<List<PlannedExpensesEntity>> call() async{
    return await _getPlannedExpensesListRepository();
  }
}
 
