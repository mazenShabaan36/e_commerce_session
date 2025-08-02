// any function that will used in more than screen on
// app and can make some thing easy to you, you can add it
// here as a static function.
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

abstract class Utils {
  static bool isPhoneNumberIsValidWithCountyCode(
    String countryCode,
    String phoneNumber,
  ) {
    PhoneNumber formattedPhoneNumber = PhoneNumber.parse(
      phoneNumber,
      callerCountry: IsoCode.fromJson(countryCode),
    );
    return formattedPhoneNumber.isValid();
  }

  static String getFormattedPhoneNumberWithCountryCode(
    String countryCode,
    String phoneNumber,
  ) {
    PhoneNumber formattedPhoneNumber = PhoneNumber.parse(
      phoneNumber,
      callerCountry: IsoCode.fromJson(countryCode),
    );
    return formattedPhoneNumber.international;
  }
}
