
class ExpenseEntity {
  int? id;
  int plannedExpensesId;
  String name;
  double value;
  String paymentType;
  String status;

  ExpenseEntity({
     this.id,
    required this.plannedExpensesId,
    required this.paymentType,
    required this.status,
    required this.name,
    required this.value,
  });
}
