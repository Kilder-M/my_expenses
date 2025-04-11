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
      width: 200,
      child: Card(
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
              _CardTitleRow(
                icon: icon,
                cardTitle: cardTitle,
                cardValueColor: cardValueColor,
              ),
              _CardValueMethod(cardValue: cardValue),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardValueMethod extends StatelessWidget {
  const _CardValueMethod({
    required this.cardValue,
  });

  final double cardValue;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: CurrencyFormatManagerUtil.getCurrencyFormat(cardValue),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          CurrencyFormatManagerUtil.getCurrencyFormat(cardValue),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _CardTitleRow extends StatelessWidget {
  const _CardTitleRow({
    required this.icon,
    required this.cardTitle,
    required this.cardValueColor,
  });

  final IconData icon;
  final String cardTitle;
  final Color? cardValueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Icon(
            icon,
            size: 16,
            color: Colors.white,
          ),
        ),
        Text(
          cardTitle,
          style: TextStyle(
            fontSize: 14,
            color: cardValueColor ?? Colors.white,
          ),
        ),
      ],
    );
  }
}
