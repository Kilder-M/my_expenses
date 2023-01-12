import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_expenses/app/core/utils/show_date_picker_util.dart';
import 'package:my_expenses/app/presentation/modules/planned_expenses/controllers/planned_expenses_form_controller.dart';
import 'package:my_expenses/app/presentation/widgets/sucess_alert_widget.dart';
import 'package:my_expenses/app/presentation/widgets/text_form_field_widget.dart';

class PlannedExpensesFormView extends GetView<PlannedExpensesFormController> {
  const PlannedExpensesFormView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatActionButton(context),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      appBar: _appBar(),
      body: _body(context),
    );
  }

  FloatingActionButton _floatActionButton(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.save_outlined),
      onPressed: () async {
        try {
          await controller.savePlannedExpenseLocalDataSource(
            controller.plannedExpensesEntity,
          );
          Get.back();
          showDialog(
            context: context,
            builder: (context) {
              Timer(const Duration(milliseconds: 1300), () => Get.back());
              return const SucessAlert(
                title: 'Salvo com sucesso!',
              );
            },
          );
        } on Exception catch (e) {
          throw Exception(e);
        }
      },
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('Novo Gasto Mensal'),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _dateTextFormField(context),
          _wageTextFormField(),
        ],
      ),
    );
  }

  TextFormFieldWidget _dateTextFormField(BuildContext context) {
    return TextFormFieldWidget(
      readOnly: true,
      textFormFieldController: controller.dateTextFormFieldController,
      enable: true,
      textInputType: TextInputType.none,
      labelText: 'Data',
      suffixIcon: _suffixiIcon(),
      onTap: () async {
        final dateTimeResponse = await ShowDatePickerUtil.getDateTime(context);
        controller.dateTextFormFieldController.text =
            ShowDatePickerUtil.formatedDateTime(dateTimeResponse) ??
                controller.dateTextFormFieldController.text;
        controller.plannedExpensesEntity.month = dateTimeResponse!;
      },
    );
  }

  Widget _suffixiIcon() {
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

  TextFormFieldWidget _wageTextFormField() {
    return TextFormFieldWidget(
      labelText: 'Ganho Mensal',
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
