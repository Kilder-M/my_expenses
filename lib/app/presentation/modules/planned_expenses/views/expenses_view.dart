import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_expenses/app/core/utils/date_time_manager_util.dart';
import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';
import 'package:my_expenses/app/presentation/modules/planned_expenses/controllers/expenses_controller.dart';
import 'package:my_expenses/app/presentation/widgets/expense_card_widget.dart';
import 'package:my_expenses/app/presentation/widgets/remainder_and_wage_and_amount_card_widget.dart';
import 'package:my_expenses/app/presentation/widgets/sucess_alert_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class ExpensesView extends GetView<ExpensesController> {
  const ExpensesView({super.key});

  @override
  Widget build(BuildContext context) {
    PlannedExpensesEntity plannedExpenseArgument = Get.arguments;
    return Scaffold(
      floatingActionButton:
          _FloatingActionButton(plannedExpenseArgument: plannedExpenseArgument),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      appBar: AppBar(
        title: Text(
          DateTimeManagerUtil.getYearAndMonth(
            plannedExpenseArgument.month,
          ),
        ),
      ),
      body: _Body(
        controller: controller,
        plannedExpenseArgument: plannedExpenseArgument,
      ),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton({
    required this.plannedExpenseArgument,
  });

  final PlannedExpensesEntity plannedExpenseArgument;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.toNamed('/expense-form', arguments: [plannedExpenseArgument, null]);
      },
      mini: true,
      child: const Icon(Icons.add),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.controller,
    required this.plannedExpenseArgument,
  });

  final ExpensesController controller;
  final PlannedExpensesEntity plannedExpenseArgument;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _RemainderAndWageAmountCardWidgetRow(
          controller: controller,
          plannedExpenseArgument: plannedExpenseArgument,
        ),
        _Subtitle(
          controller: controller,
        ),
        _ExpensesList(
          controller: controller,
          plannedExpenseArgument: plannedExpenseArgument,
        ),
      ],
    );
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({
    required this.controller,
  });

  final ExpensesController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.expenses_list,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Obx(
                  () => Text(
                    '${controller.payedExpenseLenght.value}/${controller.expensesList.length} ',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ExpensesList extends StatelessWidget {
  const _ExpensesList({
    required this.controller,
    required this.plannedExpenseArgument,
  });

  final ExpensesController controller;
  final PlannedExpensesEntity plannedExpenseArgument;

  @override
  Widget build(BuildContext context) {
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
                () => controller.expensesList.isNotEmpty
                    ? ListView.builder(
                        itemCount: controller.expensesList.length,
                        itemBuilder: ((context, index) {
                          var expense = controller.expensesList[index];
                          var switchValue = expense.isPayed.obs;
                          return Obx(
                            () => ExpenseCardWidget(
                              iconColor: Colors.orange,
                              paymentForm: expense.paymentType,
                              value: expense.value,
                              statusIcon: Icons.currency_exchange_outlined,
                              subtitle: expense.paymentType,
                              title: expense.name,
                              dismissibleKey: Key(expense.name),
                              switchValue: switchValue.value,
                              switchOnChanged: (value) async {
                                expense.isPayed = value;
                                await controller
                                    .updateExpenseStatusLocalDataSource(
                                        expense);
                                switchValue.value = expense.isPayed;
                                controller.getPayedExpenseLenght();
                              },
                              onTap: () {
                                Get.toNamed('/expense-form', arguments: [
                                  plannedExpenseArgument,
                                  expense
                                ]);
                              },
                              onDismissed: (direction) async {
                                await controller.deleteExpenseUseCase(expense);
                                await controller.getExpenseListById(
                                    plannedExpenseArgument.id!);
                                if (context.mounted) {
                                  showDialog(
                                    context: context,
                                    builder: ((context) => SucessAlert(
                                          title: AppLocalizations.of(context)!
                                              .deleted_successfully,
                                        )),
                                  );
                                }
                              },
                            ),
                          );
                        }),
                      )
                    : Center(
                        child: Text(
                          AppLocalizations.of(context)!.the_list_is_empty,
                        ),
                      ),
              );
            }
          }),
        ),
      ),
    );
  }
}

class _RemainderAndWageAmountCardWidgetRow extends StatelessWidget {
  const _RemainderAndWageAmountCardWidgetRow({
    required this.controller,
    required this.plannedExpenseArgument,
  });

  final ExpensesController controller;
  final PlannedExpensesEntity plannedExpenseArgument;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: ScrollController(initialScrollOffset: 80),
      child: Obx(
        () => Row(
          children: [
            RemainderAndWageAndAmountCardWidget(
              backgroundColor: Colors.green,
              icon: Icons.arrow_circle_up_rounded,
              cardTitle: AppLocalizations.of(context)!.monthly_earning,
              cardValue: plannedExpenseArgument.wage,
            ),
            RemainderAndWageAndAmountCardWidget(
              backgroundColor: Colors.orange,
              icon: Icons.arrow_circle_down_rounded,
              cardTitle: AppLocalizations.of(context)!.expenses,
              cardValue: plannedExpenseArgument
                  .calculateAmount(controller.expensesList),
            ),
            RemainderAndWageAndAmountCardWidget(
              backgroundColor: Colors.deepPurple,
              icon: Icons.align_vertical_bottom_rounded,
              cardTitle: AppLocalizations.of(context)!.remainder,
              cardValue: plannedExpenseArgument
                  .calculateRemainder(controller.expensesList),
            ),
          ],
        ),
      ),
    );
  }
}
