import 'package:flutter/material.dart';
import 'package:my_expenses/app/core/utils/currency_format_manager_util.dart';

class RemainderAndWageAndAmountCardWidget extends StatelessWidget {
  final String cardTitle;
  final double cardValue;
  final Color backgroundColor;
  final Color? cardValueColor;
  final IconData icon;
  const RemainderAndWageAndAmountCardWidget({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.cardTitle,
    required this.cardValue,
    this.cardValueColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 160,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cardTitleRow(),
              cardValueMethod(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox cardValueMethod() {
    return SizedBox(
      width: double.infinity,
      child: Text(
        CurrencyFormatManagerUtil.getCurrencyFormat(cardValue),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Row cardTitleRow() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Icon(
            icon,
            size: 14,
            color: Colors.white,
          ),
        ),
        Text(
          cardTitle,
          style:  TextStyle(
            fontSize: 14,
            color: cardValueColor ?? Colors.white,
          ),
        ),
      ],
    );
  }
}
