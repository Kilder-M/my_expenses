import 'package:intl/intl.dart';

class DateTimeManagerUtil {

  static String getYearAndMonth(DateTime dateTime){
    return DateFormat('${DateFormat.MONTH}/${DateFormat.YEAR}',).format(dateTime).toString();
  }
}