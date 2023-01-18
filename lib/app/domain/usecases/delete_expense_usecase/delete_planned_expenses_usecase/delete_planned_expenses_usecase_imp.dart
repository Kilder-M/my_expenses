import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';
import 'package:my_expenses/app/domain/repositories/delete_planned_expenses_repository.dart';
import 'package:my_expenses/app/domain/usecases/delete_expense_usecase/delete_planned_expenses_usecase/delete_planned_expenses_usecase.dart';

class DeletePlannedExpensesUsecaseImp implements DeletePlannedExpensesUsecase{
    final DeletePlannedExpensesRepository _deletePlannedExpensesRepository;

  DeletePlannedExpensesUsecaseImp(this._deletePlannedExpensesRepository);
  
  @override
  Future<bool> call(PlannedExpensesEntity plannedExpensesEntity) async{
    return await _deletePlannedExpensesRepository(plannedExpensesEntity);
  }

 
}