import 'package:formz/formz.dart';

enum PasswordValidationError { empty, invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');

  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) return PasswordValidationError.empty;
    return null;
  }

  String? getMessageError() {
    return error?.text();
  }
}

extension on PasswordValidationError {
  String? text() {
    switch (this) {
      case PasswordValidationError.empty:
      case PasswordValidationError.invalid:
        return '''Password can't be empty''';
    }
  }
}
