import 'package:string_validator/string_validator.dart';

import '../failures/errors.dart';

class PasswordType {
  PasswordType(String value) : value = value.trim() {
    if (!_validate(value)) {
      throw PasswordError(
        message: 'A senha inválida',
        stackTrace: StackTrace.current,
      );
    }
  }

  final String value;

  static bool _validate(String value) {
    if (value.length < 8) return false;
    return true;
  }

  static String? validate(String? value) {
    if (value == null || !_validate(value)) {
      return 'A senha inválida';
    }

    return null;
  }
}
