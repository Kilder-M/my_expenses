import 'package:flutter/material.dart';

class PlannedExpensesCardWidget extends StatelessWidget {
  final String title, status;
  final IconData statusIcon;
  final Color iconColor;
  final void Function()? onTap;
  const PlannedExpensesCardWidget(
      {super.key,
      required this.title,
      this.onTap,
      required this.status,
      required this.statusIcon,
      required this.iconColor});

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
        subtitle: Row(
          children: [
            Icon(
              statusIcon,
              color: iconColor,
              size: 16,
            ),
            Text(status),
          ],
        ),
        leading: const CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.calendar_month_outlined,
            color: Colors.black87,
            size: 30,
          ),
        ),
        onTap: onTap,
        minLeadingWidth: 20,
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Icon(
              Icons.more_horiz,
              color: Colors.black87,
            ),
          ],
        ),
        title: Text(title),
      ),
    );
  }
}
