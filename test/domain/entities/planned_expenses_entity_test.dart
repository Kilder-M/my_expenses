import 'package:flutter_test/flutter_test.dart';
import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';

void main() {
  group('Testing planned expenses entity:', () {
    PlannedExpensesEntity plannedExpensesEntity = PlannedExpensesEntity(
      id: 1,
      month: DateTime(2022, 12),
      amount: 0.0,
      wage: 1200.0,
      remainder: 0.0,
    );
    
    test('should return a planned expenses not null', (){
      expect(plannedExpensesEntity, isNotNull);
    });

    test('should return the correct id', (){
      expect(plannedExpensesEntity.id, 1);
    });
    
    test('should return the correct amount', (){
      var expectResponse = plannedExpensesEntity.calculateAmount;
      expect(expectResponse, 280.0);
    });
    test('should return the correct remainder', (){
      var expectResponse = plannedExpensesEntity.calculateRemainder;
      expect(expectResponse, 920.0);
    });
  });
}
