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
    this.status = 'Não pago',
    required this.name,
    required this.value,
  });
}
