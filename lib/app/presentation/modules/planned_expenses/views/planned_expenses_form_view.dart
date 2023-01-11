import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_expenses/app/core/utils/show_date_picker_util.dart';
import 'package:my_expenses/app/presentation/modules/planned_expenses/controllers/planned_expenses_form_controller.dart';
import 'package:my_expenses/app/presentation/widgets/text_form_field_widget.dart';

class PlannedExpensesFormView extends GetView<PlannedExpensesFormController> {
  const PlannedExpensesFormView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dateTextFormFieldController = TextEditingController();
    final valueTextFormFieldController = TextEditingController();
    final currecyFormat = CurrencyTextInputFormatter(
      locale: 'pt',
      symbol: 'R\$',
    );
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save_outlined),
        onPressed: () {},
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      appBar: AppBar(
        title: const Text('Novo Gasto Mensal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormFieldWidget(
              readOnly: true,
              labelText: 'Data',
              suffixIcon: GestureDetector(
                onTap: () {
                  dateTextFormFieldController.clear();
                },
                child: const Icon(
                  Icons.close_outlined,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              textFormFieldController: dateTextFormFieldController,
              enable: true,
              textInputType: TextInputType.none,
              onTap: () async {
                final dateTimeResponse =
                    await ShowDatePickerUtil.getDateTime(context);
                dateTextFormFieldController.text =
                    ShowDatePickerUtil.formatedDateTime(dateTimeResponse) ??
                        dateTextFormFieldController.text;
                controller.plannedExpensesEntity.month = dateTimeResponse!;
              },
            ),
            TextFormFieldWidget(
              labelText: 'Ganho Mensal',
              textFormFieldController: valueTextFormFieldController,
              textInputType: TextInputType.number,
              inputFormatters: [currecyFormat],
              onChanged: (value) {
                controller.plannedExpensesEntity.wage =
                    double.parse(currecyFormat.getUnformattedValue().toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
