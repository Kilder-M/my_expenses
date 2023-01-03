import 'package:intl/intl.dart';

class CurrencyFormatManagerUtil {
  static String getCurrencyFormat(double value) {
    return NumberFormat.currency(
      locale: 'pt',
      symbol: 'R\$'
    ).format(value);
  }
}
