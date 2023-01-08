import 'package:flutter/material.dart';
import 'package:my_expenses/app/core/utils/currency_format_manager_util.dart';

class RemainderAndWageAndAmountCardWidget extends StatelessWidget {
  const RemainderAndWageAndAmountCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  wageAndExpenseAmount(
                    title: 'GANHOS',
                    subtitle: 10.00,
                  ),
                  wageAndExpenseAmount(
                    title: 'DESPESAS',
                    subtitle: 10.00,
                  ),
                ],
              ),
              remainderValue()
            ],
          ),
        ),
      ),
    );
  }

  Column wageAndExpenseAmount({
    required String title,
    required double subtitle,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            letterSpacing: -0.5,
            color: Colors.grey[600],
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          CurrencyFormatManagerUtil.getCurrencyFormat(subtitle),
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget remainderValue() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'SOBRA',
          style: TextStyle(
            fontSize: 12,
            letterSpacing: -0.5,
            color: Colors.grey[600],
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          CurrencyFormatManagerUtil.getCurrencyFormat(10.00),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
