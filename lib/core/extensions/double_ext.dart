import 'dart:ffi';

import 'package:intl/intl.dart';

extension DoubleExt on Double {
  String toCurrency() {
    final formatCurrency = NumberFormat.simpleCurrency();
    return "${formatCurrency.format(this)} EGP";
  }
}
