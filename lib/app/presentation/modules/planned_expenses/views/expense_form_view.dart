import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_expenses/app/domain/entities/planned_expenses_entity.dart';
import 'package:my_expenses/app/presentation/modules/planned_expenses/controllers/expense_form_controller.dart';
import 'package:my_expenses/app/presentation/widgets/drop_down_form_field_widget.dart';
import 'package:my_expenses/app/presentation/widgets/sucess_alert_widget.dart';
import 'package:my_expenses/app/presentation/widgets/text_form_field_widget.dart';

class ExpenseFormView extends GetView<ExpenseFormController> {
  const ExpenseFormView({super.key});

  @override
  Widget build(BuildContext context) {
    PlannedExpensesEntity plannedExpensesArgument = Get.arguments[0];
    controller.expenseEntity = Get.arguments[1] ?? controller.expenseEntity;

    return Scaffold(
      floatingActionButton:
          _floatActionButton(context, plannedExpensesArgument),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      appBar: _appBar(),
      body: _body(),
    );
  }

  FloatingActionButton _floatActionButton(
      BuildContext context, PlannedExpensesEntity plannedExpenseArgument) {
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
          showDialog(
            context: context,
            builder: (context) {
              return SucessAlert(
                title: controller.expenseEntity.id == null
                    ? 'Salvo com sucesso!'
                    : 'Editado com sucesso!',
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
      title: Text(
        controller.expenseEntity.id == null ? 'Novo Gasto' : 'Editando Gasto',
      ),
    );
  }

  Padding _body() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _nameTexFormField(),
            _valueTextFormField(),
            _dropDownButtonFormField()
          ],
        ),
      ),
    );
  }

  TextFormFieldWidget _nameTexFormField() {
    return TextFormFieldWidget(
      initialValue: controller.expenseEntity.name,
      labelText: 'Nome',
      onChanged: (value) {
        controller.expenseEntity.name = value;
      },
    );
  }

  TextFormFieldWidget _valueTextFormField() {
    return TextFormFieldWidget(
      initialValue: controller.expenseEntity.value.toString(),
      labelText: 'Valor',
      textInputType: TextInputType.number,
      inputFormatters: [controller.currecyFormat],
      onChanged: (value) {
        controller.expenseEntity.value = double.parse(
          controller.currecyFormat.getUnformattedValue().toString(),
        );
      },
    );
  }

  DropDownButtonFormFieldWidget _dropDownButtonFormField() {
    return DropDownButtonFormFieldWidget(
      dropDownValue: controller.expenseEntity.paymentType,
      labelText: 'Tipo de Pagamento',
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
