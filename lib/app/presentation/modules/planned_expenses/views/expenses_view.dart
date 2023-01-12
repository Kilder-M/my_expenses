import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_expenses/app/core/utils/date_time_manager_util.dart';
import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';
import 'package:my_expenses/app/presentation/modules/planned_expenses/controllers/expenses_controller.dart';
import 'package:my_expenses/app/presentation/widgets/expense_card_widget.dart';
import 'package:my_expenses/app/presentation/widgets/remainder_and_wage_and_amount_card_widget.dart';

class ExpensesView extends GetView<ExpensesController> {
  const ExpensesView({super.key});

  @override
  Widget build(BuildContext context) {
    PlannedExpensesEntity plannedExpenseArgument = Get.arguments;
    return Scaffold(
      floatingActionButton: _floatActionButton(plannedExpenseArgument),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      appBar: _appBar(plannedExpenseArgument),
      body: _body(plannedExpenseArgument),
    );
  }

  FloatingActionButton _floatActionButton(
      PlannedExpensesEntity plannedExpenseArgument) {
    return FloatingActionButton(
      onPressed: () {
        Get.toNamed('/expense-form', arguments: plannedExpenseArgument);
      },
      mini: true,
      child: const Icon(Icons.add),
    );
  }

  AppBar _appBar(PlannedExpensesEntity plannedExpenseArgument) {
    return AppBar(
      title: Text(
        DateTimeManagerUtil.getYearAndMonth(
          plannedExpenseArgument.month,
        ),
      ),
    );
  }

  Widget _body(PlannedExpensesEntity plannedExpenseArgument) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _remainderAndWageAndAmountCardWidgetRow(plannedExpenseArgument),
        _subtitle(),
        _expenseList(plannedExpenseArgument),
      ],
    );
  }

  Widget _remainderAndWageAndAmountCardWidgetRow(
      PlannedExpensesEntity plannedExpenseArgument) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: ScrollController(initialScrollOffset: 80),
      child: Row(
        children: [
          RemainderAndWageAndAmountCardWidget(
            backgroundColor: Colors.green,
            icon: Icons.arrow_circle_up_rounded,
            cardTitle: 'Ganho mensal',
            cardValue: plannedExpenseArgument.wage,
          ),
          RemainderAndWageAndAmountCardWidget(
            backgroundColor: Colors.orange,
            icon: Icons.arrow_circle_down_rounded,
            cardTitle: 'Despesas',
            cardValue: plannedExpenseArgument.calculateAmount(controller.expensesList),
          ),
          RemainderAndWageAndAmountCardWidget(
            backgroundColor: Colors.deepPurple,
            icon: Icons.arrow_circle_up_rounded,
            cardTitle: 'Sobra',
            cardValue: plannedExpenseArgument.calculateRemainder(controller.expensesList),
          ),
        ],
      ),
    );
  }

  Widget _subtitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Text(
        'Lista de Gastos',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _expenseList(PlannedExpensesEntity plannedExpenseArgument) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: FutureBuilder(
          future: controller.getExpenseListById(plannedExpenseArgument.id!),
          builder: ((context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                ),
              );
            } else {
              return Obx(
                () => ListView.builder(
                  itemCount: controller.expensesList.length,
                  itemBuilder: ((context, index) {
                    var plannedExpense = controller.expensesList[index];
                    return ExpenseCardWidget(
                      iconColor: Colors.orange,
                      // onTap: () {
                      // },
                      paymentForm: plannedExpense.paymentType,
                      value: plannedExpense.value,
                      statusIcon: Icons.currency_exchange_outlined,
                      subtitle: plannedExpense.paymentType,
                      title: plannedExpense.name,
                    );
                  }),
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
