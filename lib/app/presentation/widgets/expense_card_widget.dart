import 'package:flutter/material.dart';
import 'package:my_expenses/app/core/utils/currency_format_manager_util.dart';

class ExpenseCardWidget extends StatelessWidget {
  final String title, subtitle, paymentForm;
  final double value;
  final IconData statusIcon;
  final Color iconColor;
  final bool switchValue;
  final void Function()? onTap;
  final void Function(bool)? switchOnChanged;

  const ExpenseCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.statusIcon,
    required this.iconColor,
    required this.value,
    required this.paymentForm,
    this.onTap,
    this.switchOnChanged,
    required this.switchValue,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      shadowColor: Colors.deepPurple,
      margin: const EdgeInsets.all(2),
      child: ListTile(
        subtitle: subtitleStatus(),
        leading: leadingIcon(),
        onTap: onTap,
        minLeadingWidth: 20,
        trailing: trailingColumn(),
        title: Text(title),
      ),
    );
  }

  Column trailingColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [trailingSwitch(), valueField()],
    );
  }

  Widget trailingSwitch() {
    return SizedBox(
        height: 20,
        width: 50,
        child: Switch(
          value: switchValue,
          activeColor: Colors.green,
          onChanged: switchOnChanged,
        ));
  }

  Widget subtitleStatus() {
    return Text(subtitle);
  }

  CircleAvatar leadingIcon() {
    return const CircleAvatar(
      backgroundColor: Colors.white,
      child: Icon(
        Icons.attach_money_outlined,
        color: Colors.orange,
        size: 35,
      ),
    );
  }

  Padding valueField() {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: Text(
        CurrencyFormatManagerUtil.getCurrencyFormat(value),
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
