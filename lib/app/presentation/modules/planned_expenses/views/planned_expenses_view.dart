import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_expenses/app/core/utils/date_time_manager_util.dart';
import 'package:my_expenses/app/presentation/widgets/planned_expenses_card_widget.dart';
import 'package:my_expenses/app/presentation/widgets/sucess_alert_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../controllers/planned_expenses_controller.dart';

class PlannedExpensesView extends GetView<PlannedExpensesController> {
  const PlannedExpensesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const _FloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.monthly_expenses,
        ),
        // actions: [
        // IconButton(
        //   icon: const Icon(Icons.filter_list_outlined),
        //   onPressed: () {},
        // ),
        // ],
      ),
      body: _Body(controller: controller),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.controller,
  });

  final PlannedExpensesController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 0),
      child: FutureBuilder(
        future: controller.getPlannedExpensesLocalDataSource(),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return const _CircularProgressIndicator();
          } else {
            return _ListViewBuilder(controller: controller);
          }
        }),
      ),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      onPressed: () {
        Get.toNamed('/planned-expenses-form');
      },
      child: const Icon(Icons.add),
    );
  }
}

class _ListViewBuilder extends StatelessWidget {
  const _ListViewBuilder({
    required this.controller,
  });

  final PlannedExpensesController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.plannedExpenseList.isNotEmpty
          ? ListView.builder(
              itemCount: controller.plannedExpenseList.length,
              itemBuilder: ((context, index) {
                var plannedExpense = controller.plannedExpenseList[index];
                return PlannedExpensesCardWidget(
                  iconColor: Colors.orange,
                  onTapIcon: () {
                    showDialog(
                      context: context,
                      builder: ((context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            title: Text(AppLocalizations.of(context)!
                                .do_you_want_to_delete),
                            actions: [
                              TextButton(
                                onPressed: Get.back,
                                child: Text(AppLocalizations.of(context)!.no),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await controller
                                      .deletePlannedExpensesLocalDataSource(
                                          plannedExpense);
                                  Get.back();
                                  if (context.mounted) {
                                    showDialog(
                                      context: context,
                                      builder: ((context) => SucessAlert(
                                            title: AppLocalizations.of(context)!
                                                .monthly_expenses_was_deleted_successfully,
                                          )),
                                    );
                                  }
                                },
                                child: Text(AppLocalizations.of(context)!.yes),
                              )
                            ],
                          )),
                    );
                  },
                  onTap: () {
                    Get.toNamed('/expenses', arguments: plannedExpense);
                  },
                  statusIcon: Icons.timer_outlined,
                  status: AppLocalizations.of(context)!.in_progress,
                  title: DateTimeManagerUtil.getYearAndMonth(
                    plannedExpense.month,
                  ),
                );
              }),
            )
          : Center(
              child: Text(AppLocalizations.of(context)!.the_list_is_empty),
            ),
    );
  }
}

class _CircularProgressIndicator extends StatelessWidget {
  const _CircularProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 1.5,
      ),
    );
  }
}
