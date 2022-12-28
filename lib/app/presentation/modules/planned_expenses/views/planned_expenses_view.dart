import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_expenses/app/presentation/widgets/planned_expenses_card_widget.dart';

import '../controllers/planned_expenses_controller.dart';

class PlannedExpensesView extends GetView<PlannedExpensesController> {
  const PlannedExpensesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(4, 8, 4, 0),
        child: FutureBuilder(
          future: controller.getPlannedExpensesLocalDataSource(),
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
                  itemCount: controller.plannedExpenseList.length,
                  itemBuilder: ((context, index) {
                    var plannedExpense = controller.plannedExpenseList[index];
                    return PlannedExpensesCardWidget(
                        title: plannedExpense.month.toString());
                  }),
                ),
              );
            }
          }),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const Text(
        'Gastos Mensais',
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.filter_list_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}
