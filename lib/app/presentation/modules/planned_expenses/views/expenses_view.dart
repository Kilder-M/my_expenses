import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_expenses/app/core/utils/currency_format_manager_util.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        mini: true,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      appBar: appBar(plannedExpenseArgument),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RemainderAndWageAndAmountCardWidget(),
          subtitle(),
          expenseList(plannedExpenseArgument),
        ],
      ),
    );
  }

  AppBar appBar(PlannedExpensesEntity plannedExpenseArgument) {
    return AppBar(
      title: Text(
        DateTimeManagerUtil.getYearAndMonth(
          plannedExpenseArgument.month,
        ),
      ),
    );
  }

  Padding titleAndSubTitlesRow(PlannedExpensesEntity plannedExpenseArgument) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          titleAndSubtitle(
              title: 'GANHOS', subtitle: plannedExpenseArgument.wage),
          titleAndSubtitle(
              title: 'GASTOS',
              subtitle: plannedExpenseArgument.calculateAmount),
          titleAndSubtitle(
              title: 'SOBRA',
              subtitle: plannedExpenseArgument.calculateRemainder),
        ],
      ),
    );
  }

  Column titleAndSubtitle({required String title, required double subtitle}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            letterSpacing: -0.5,
            color: Colors.grey[600],
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          CurrencyFormatManagerUtil.getCurrencyFormat(subtitle),
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget subtitle() {
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

  Widget expenseList(PlannedExpensesEntity plannedExpenseArgument) {
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
