import 'package:flutter/services.dart';
import 'package:session/core/validators/app_reg_exp.dart';

abstract class AppInputFormatters {
  static List<TextInputFormatter> numbers = [
    FilteringTextInputFormatter.allow(AppRegExp.numbers),
  ];
}
