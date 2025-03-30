import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';
import 'package:my_expenses/app/presentation/modules/planned_expenses/controllers/expense_form_controller.dart';
import 'package:my_expenses/app/presentation/widgets/drop_down_form_field_widget.dart';
import 'package:my_expenses/app/presentation/widgets/sucess_alert_widget.dart';
import 'package:my_expenses/app/presentation/widgets/text_form_field_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class ExpenseFormView extends GetView<ExpenseFormController> {
  const ExpenseFormView({super.key});

  @override
  Widget build(BuildContext context) {
    PlannedExpensesEntity plannedExpensesArgument = Get.arguments[0];
    controller.expenseEntity = Get.arguments[1] ?? controller.expenseEntity;

    return Scaffold(
      floatingActionButton: _FloatActionButton(
        controller: controller,
        context: context,
        plannedExpenseArgument: plannedExpensesArgument,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      appBar: AppBar(
        title: Text(
          controller.expenseEntity.id == null
              ? AppLocalizations.of(context)!.new_expense
              : AppLocalizations.of(context)!.editing_expense,
        ),
      ),
      body: _Body(controller: controller),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.controller,
  });

  final ExpenseFormController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _NameTextFormField(controller: controller),
            _ValueTextFormFIeld(controller: controller),
            _DropDownButtonFormField(controller: controller)
          ],
        ),
      ),
    );
  }
}

class _DropDownButtonFormField extends StatelessWidget {
  const _DropDownButtonFormField({
    required this.controller,
  });

  final ExpenseFormController controller;

  @override
  Widget build(BuildContext context) {
    return DropDownButtonFormFieldWidget(
      dropDownValue: controller.expenseEntity.paymentType,
      labelText: AppLocalizations.of(context)!.payment_type,
      onChanged: (value) {
        controller.expenseEntity.paymentType = value;
      },
      items: controller.paymentypeList
          .map(
            (e) => DropdownMenuItem<String>(
              value: e.paymentTypeName,
              child: Text(e.paymentTypeName),
            ),
          )
          .toList(),
    );
  }
}

class _ValueTextFormFIeld extends StatelessWidget {
  const _ValueTextFormFIeld({
    required this.controller,
  });

  final ExpenseFormController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      initialValue: controller.expenseEntity.value.toString(),
      labelText: AppLocalizations.of(context)!.value,
      textInputType: TextInputType.number,
      inputFormatters: [controller.currecyFormat],
      onChanged: (value) {
        controller.expenseEntity.value = double.parse(
          controller.currecyFormat.getUnformattedValue().toString(),
        );
      },
    );
  }
}

class _NameTextFormField extends StatelessWidget {
  const _NameTextFormField({
    required this.controller,
  });

  final ExpenseFormController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      initialValue: controller.expenseEntity.name,
      labelText: AppLocalizations.of(context)!.name,
      onChanged: (value) {
        controller.expenseEntity.name = value;
      },
    );
  }
}

class _FloatActionButton extends StatelessWidget {
  const _FloatActionButton({
    required this.controller,
    required this.context,
    required this.plannedExpenseArgument,
  });

  final ExpenseFormController controller;
  final BuildContext context;
  final PlannedExpensesEntity plannedExpenseArgument;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      child: const Icon(Icons.save_outlined),
      onPressed: () async {
        try {
          controller.expenseEntity.id == null
              ? await controller
                  .saveExpenseLocalDataSource(plannedExpenseArgument.id!)
              : await controller
                  .updateExpenseLocalDataSource(plannedExpenseArgument.id!);

          Get.back();
          if (context.mounted) {
            showDialog(
              context: context,
              builder: (context) {
                return SucessAlert(
                  title: controller.expenseEntity.id == null
                      ? AppLocalizations.of(context)!.saved_successfully
                      : AppLocalizations.of(context)!.edited_successfully,
                );
              },
            );
          }
        } on Exception catch (e) {
          throw Exception(e);
        }
      },
    );
  }
}
