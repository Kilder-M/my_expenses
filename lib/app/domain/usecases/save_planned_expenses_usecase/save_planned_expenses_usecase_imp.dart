import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';
import 'package:my_expenses/app/domain/repositories/save_planned_expenses_repository.dart';
import 'package:my_expenses/app/domain/usecases/save_planned_expenses_usecase/save_planned_expense_usecase.dart';

class SavePlannedExpensesUseCaseImp implements SavePlannedExpensesUseCase {
  final SavePlannedExpensesRepository _savePlannedExpensesRepository;

  SavePlannedExpensesUseCaseImp(this._savePlannedExpensesRepository);
  @override
  Future<bool> save(PlannedExpensesEntity plannedExpensesEntity) async {
    return await _savePlannedExpensesRepository.save(plannedExpensesEntity);
  }
}
