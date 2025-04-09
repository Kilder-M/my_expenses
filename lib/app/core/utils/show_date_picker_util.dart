import 'package:flutter/material.dart';
import 'package:my_expenses/app/core/utils/date_time_manager_util.dart';

class ShowDatePickerUtil {


  static Future<DateTime?> getDateTime(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year, DateTime.now().month,1),
      firstDate: DateTime(DateTime.now().year, 1,1),
      lastDate: DateTime(DateTime.now().year, 12,1),
   
    );
  }

  static String? formatedDateTime(DateTime? dateTime) {
    if (dateTime != null) return DateTimeManagerUtil.getYearAndMonth(dateTime);
    return null;
  }
}
