import 'package:intl/intl.dart';

String formatPrice(double? price) {
  if (price == null) {
    return '0';
  }
  return NumberFormat('#,##0', 'ru_RU')
      .format(int.parse(price.toString().split('.')[0]));
}
