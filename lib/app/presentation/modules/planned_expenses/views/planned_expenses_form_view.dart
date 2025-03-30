import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_expenses/app/core/utils/show_date_picker_util.dart';
import 'package:my_expenses/app/presentation/modules/planned_expenses/controllers/planned_expenses_form_controller.dart';
import 'package:my_expenses/app/presentation/widgets/sucess_alert_widget.dart';
import 'package:my_expenses/app/presentation/widgets/text_form_field_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class PlannedExpensesFormView extends GetView<PlannedExpensesFormController> {
  const PlannedExpensesFormView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:
            _FloatActionButton(controller: controller, context: context),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(
          title:  Text(AppLocalizations.of(context)!.new_monthly_expenses),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _DateTextFormField(
                controller: controller,
              ),
              _WageTextFormFiled(controller: controller),
            ],
          ),
        ));
  }
}

class _FloatActionButton extends StatelessWidget {
  const _FloatActionButton({
    required this.controller,
    required this.context,
  });

  final PlannedExpensesFormController controller;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      child: const Icon(Icons.save_outlined),
      onPressed: () async {
        try {
          await controller.savePlannedExpenseLocalDataSource(
            controller.plannedExpensesEntity,
          );
          Get.back();
          if (context.mounted) {
            showDialog(
              context: context,
              builder: (context) {
                return  SucessAlert(
                  title: AppLocalizations.of(context)!.saved_successfully,
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

class _SuffixIcon extends StatelessWidget {
  const _SuffixIcon({
    required this.controller,
  });

  final PlannedExpensesFormController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.dateTextFormFieldController.clear();
      },
      child: const Icon(
        Icons.close_outlined,
        color: Colors.black,
        size: 20,
      ),
    );
  }
}

class _WageTextFormFiled extends StatelessWidget {
  const _WageTextFormFiled({
    required this.controller,
  });

  final PlannedExpensesFormController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      labelText: AppLocalizations.of(context)!.monthly_earning,
      textFormFieldController: controller.valueTextFormFieldController,
      textInputType: TextInputType.number,
      inputFormatters: [controller.currecyFormat],
      onChanged: (value) {
        controller.plannedExpensesEntity.wage = double.parse(
            controller.currecyFormat.getUnformattedValue().toString());
      },
    );
  }
}

class _DateTextFormField extends StatelessWidget {
  final PlannedExpensesFormController controller;

  const _DateTextFormField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      readOnly: true,
      textFormFieldController: controller.dateTextFormFieldController,
      enable: true,
      textInputType: TextInputType.none,
      labelText: AppLocalizations.of(context)!.date,
      suffixIcon: _SuffixIcon(
        controller: controller,
      ),
      onTap: () async {
        final dateTimeResponse = await ShowDatePickerUtil.getDateTime(context);
        controller.dateTextFormFieldController.text =
            ShowDatePickerUtil.formatedDateTime(dateTimeResponse) ??
                controller.dateTextFormFieldController.text;
        controller.plannedExpensesEntity.month = dateTimeResponse!;
      },
    );
  }
}
