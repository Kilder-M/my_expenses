import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';
import 'package:my_expenses/app/domain/usecases/get_planned_expenses_usecase/get_planned_expenses_list_usecase_imp.dart';

class MockGetPlannedExpensesListUsecaseImp extends Mock implements GetPlannedExpensesListUsecaseImp{}

void main() {
  final getPlanneExpensesListUsecaseImp = MockGetPlannedExpensesListUsecaseImp();

  group('Testing get planned expenses list use case implement:', (){
    PlannedExpensesEntity plannedExpensesEntity = PlannedExpensesEntity(
      id: 1,
      month: DateTime(2022, 12),
      amount: 0.0,
      wage: 1200.0,
      remainder: 0.0,
    );
    test('Should return a planned expenses list', ()async{
      when(() => getPlanneExpensesListUsecaseImp(),).thenAnswer((invocation) async=> [plannedExpensesEntity]);
      final response = await getPlanneExpensesListUsecaseImp();
      expect(response, isA<List<PlannedExpensesEntity>>());
    });
  });
}