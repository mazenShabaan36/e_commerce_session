import 'package:session/core/app_strings.dart';
import 'package:session/core/validators/app_validator.dart';

class ConfirmPasswordAppValidator extends AppValidator {
  ConfirmPasswordAppValidator({super.initValue});

  String _comparedWithPassword = "";

  set comparedWithPassword(password) {
    _comparedWithPassword = password;
    setValue(value);
  }

  @override
  List<String> check() {
    List<String> resons = [];

    if (value != _comparedWithPassword) {
      resons.add(AppStrings.passwordDontMatch);
    }

    return resons;
  }
}
