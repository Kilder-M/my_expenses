import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_expenses/app/core/utils/date_time_manager_util.dart';
import 'package:my_expenses/app/presentation/widgets/planned_expenses_card_widget.dart';

import '../controllers/planned_expenses_controller.dart';

class PlannedExpensesView extends GetView<PlannedExpensesController> {
  const PlannedExpensesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatingActionButton(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      appBar: _appBar(context),
      body: _body(),
    );
  }

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
      mini: true,
      onPressed: () {
        Get.toNamed('/planned-expenses-form');
      },
      child: const Icon(Icons.add),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Gastos Mensais',
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.filter_list_outlined),
          onPressed: () {},
        ),
      ],
    );
  }

  Padding _body() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 0),
      child: FutureBuilder(
        future: controller.getPlannedExpensesLocalDataSource(),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return _circularProgressIndicator();
          } else {
            return _listViewBuilder();
          }
        }),
      ),
    );
  }

  Center _circularProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 1.5,
      ),
    );
  }
  
  Widget _listViewBuilder() {
    return Obx(
      () => ListView.builder(
        itemCount: controller.plannedExpenseList.length,
        itemBuilder: ((context, index) {
          var plannedExpense = controller.plannedExpenseList[index];
          return PlannedExpensesCardWidget(
            iconColor: Colors.orange,
            onTap: () {
              Get.toNamed('/expenses', arguments: plannedExpense);
            },
            statusIcon: Icons.timer_outlined,
            status: 'Em Andamento',
            title: DateTimeManagerUtil.getYearAndMonth(
              plannedExpense.month,
            ),
          );
        }),
      ),
    );
  }

  
}
