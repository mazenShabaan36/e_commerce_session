import 'package:session/core/app_strings.dart';
import 'package:session/core/utils/utils.dart';
import 'package:session/core/validators/app_validator.dart';

class PhoneAppValidator extends AppValidator {
  String get formatedPhoneNumberWithCountryCode =>
      Utils.getFormattedPhoneNumberWithCountryCode("EG", value);

  PhoneAppValidator({super.initValue});

  @override
  List<String> check() {
    List<String> resons = [];

    if (value.isEmpty) {
      resons.add(AppStrings.requiredField);
    }

    if (!Utils.isPhoneNumberIsValidWithCountyCode("EG", value)) {
      resons.add(AppStrings.invalidPhone);
    }

    return resons;
  }
}
