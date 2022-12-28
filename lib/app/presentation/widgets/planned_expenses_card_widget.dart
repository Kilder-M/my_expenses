import 'package:flutter/material.dart';

class PlannedExpensesCardWidget extends StatelessWidget {
  final String title;
  const PlannedExpensesCardWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      // subtitle: Text('R\$: 1000,00'),
      leading: const Icon(
        Icons.calendar_month_outlined,
      ),
      trailing: const Icon(Icons.more_horiz),
      title: Text(title),
    );
  }
}
