class ExpenseEntity {
  int? id;
  int plannedExpensesId;
  String name;
  double value;
  String paymentType;
  bool isPayed;

  ExpenseEntity({
    this.id,
    required this.plannedExpensesId,
    required this.paymentType,
    this.isPayed = false,
    required this.name,
    required this.value,
  });
}
