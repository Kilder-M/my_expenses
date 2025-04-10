import 'package:flutter/material.dart';
import 'package:my_expenses/app/core/utils/currency_format_manager_util.dart';

class ExpenseCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String paymentForm;
  final double value;
  final IconData statusIcon;
  final Color iconColor;
  final bool switchValue;
  final Key dismissibleKey;
  final void Function()? onTap;
  final void Function(bool)? switchOnChanged;
  final Function(DismissDirection)? onDismissed;

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
    required this.dismissibleKey,
    this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: onDismissed,
      key: dismissibleKey,
      child: Card(
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        shadowColor: Colors.deepPurple,
        margin: const EdgeInsets.all(2),
        child: ListTile(
          subtitle: Text(subtitle),
          leading: const _LeadingIcon(),
          onTap: onTap,
          minLeadingWidth: 20,
          trailing: _TrailingColumn(
              switchValue: switchValue,
              switchOnChanged: switchOnChanged,
              value: value),
          title: Text(title),
        ),
      ),
    );
  }
}

class _TrailingColumn extends StatelessWidget {
  const _TrailingColumn({
    required this.switchValue,
    required this.switchOnChanged,
    required this.value,
  });

  final bool switchValue;
  final void Function(bool p1)? switchOnChanged;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _TrailingSwitch(
            switchValue: switchValue, switchOnChanged: switchOnChanged),
        _ValueField(value: value)
      ],
    );
  }
}

class _LeadingIcon extends StatelessWidget {
  const _LeadingIcon();

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.white,
      child: Icon(
        Icons.attach_money_outlined,
        color: Colors.orange,
        size: 35,
      ),
    );
  }
}

class _ValueField extends StatelessWidget {
  const _ValueField({
    required this.value,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
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

class _TrailingSwitch extends StatelessWidget {
  const _TrailingSwitch({
    required this.switchValue,
    required this.switchOnChanged,
  });

  final bool switchValue;
  final void Function(bool value)? switchOnChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 50,
      child: Switch(
        value: switchValue,
        activeColor: Colors.green,
        onChanged: switchOnChanged,
      ),
    );
  }
}
