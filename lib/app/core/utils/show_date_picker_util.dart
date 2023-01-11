import 'package:flutter/material.dart';
import 'package:my_expenses/app/core/utils/date_time_manager_util.dart';

class ShowDatePickerUtil {
  static Future<DateTime?> getFormattedDateTime(BuildContext context) async {
    return await showDatePicker(
      context: context,
      locale: const Locale('pt'),
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year, 01, 01),
      lastDate: DateTime(DateTime.now().year, 12),
      builder: (context, child) {
        return Theme(
          data: ThemeData().copyWith(
            colorScheme: const ColorScheme.light(
              surface: Colors.deepPurple,
            ),
          ),
          child: child ?? const SizedBox(),
        );
      },
    );
  }

  static String? formatedDateTime(DateTime? dateTime) {
    if (dateTime != null) return DateTimeManagerUtil.getYearAndMonth(dateTime);
    return null;
  }
}
