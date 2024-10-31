import 'package:flutter/services.dart';
import 'package:geomaks_test/src/core/extension/extensions.dart';
import 'package:flutter/material.dart';

class ValidatorUtil {
  ValidatorUtil._();

  static String? emailValidator(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    if (!value.emailValidator()) {
      return '';
    }

    return null;
  }

  static String? emaiOrPhonelValidator(
    BuildContext context,
    String? value, {
    String? errorMessage,
  }) {
    if (errorMessage != null) {
      return errorMessage;
    }

    if (value == null || value.isEmpty) {
      return '';
    }

    if (value.isOnlyDigits()) {
      if (value.length > 8) {
        final phone = value.substring(1, value.length);
        if (phone.isNumeric()) {
          return null;
        } else {
          return '';
        }
      }
      // else if (value.length < 12) {
      //   return null;
      //   // switch (12 - value.length) {
      //   //   case 4:
      //   //   case 3:
      //   //   case 2:
      //   //     return 'Не хватает ${12 - value.length} цифры телефонного номера';
      //   //   case 1:
      //   //     return 'Не хватает ${12 - value.length} цифра телефонного номера';
      //   //   default:
      //   //     return 'Не хватает ${12 - value.length} цифр телефонного номера';
      //   // }
      // }
      else {
        final phone = value.substring(1, value.length);
        if (phone.isNumeric()) {
          return '';
        } else {
          return '';
        }
      }
      // if (!value.isPhone()) {
      //   return context.localized.incorrectFormat;
      // }
      // return null;
    } else {
      // if (!value.emailValidator() && !value.isPhone()) {
      //   return 'Please enter a valid email or phone number.';
      // }
      if (value.length == 1 && value.startsWith('+')) {
        return null;
      } else if (!value.emailValidator() && !value.startsWith('+')) {
        return '';
      } else if (value.startsWith('+') && !value.isOnlyDigits()) {
        return '';
      }

      return null;
    }
  }

  static String? phonelValidator(
    BuildContext context,
    String? value, {
    String? errorMessage,
    bool enablePlusValidator = false,
  }) {
    if (errorMessage != null) {
      return errorMessage;
    }

    if (value == null || value.isEmpty) {
      return '';
    }

    if (enablePlusValidator && !value.startsWith('+')) {
      return '';
    }

    // if (value.isOnlyDigits()) {
    if (value.length > 8) {
      final phone = value.substring(1, value.length);
      if (phone.isNumeric()) {
        return null;
      } else {
        return '';
      }
    }
    // else if (value.length < 12) {
    //   return null;
    //   // switch (12 - value.length) {
    //   //   case 4:
    //   //   case 3:
    //   //   case 2:
    //   //     return 'Не хватает ${12 - value.length} цифры телефонного номера';
    //   //   case 1:
    //   //     return 'Не хватает ${12 - value.length} цифра телефонного номера';
    //   //   default:
    //   //     return 'Не хватает ${12 - value.length} цифр телефонного номера';
    //   // }
    // }
    else {
      final phone = value.substring(1, value.length);
      if (phone.isNumeric()) {
        return '';
      } else {
        return '';
      }
    }
    // if (!value.isPhone()) {
    //   return context.localized.incorrectFormat;
    // }
    // return null;
  }

  static String? phone(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    if (value.length < 16) {
      return '';
    }

    return null;
  }

  static String? passwordValidator(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    if (value.length < 6) {
      return '';
    }
    return null;
  }

  static String? notEmptyFieldValidator(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    return null;
  }
}



class UpperCaseTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text.toUpperCase().replaceAll(RegExp(r'[^A-Z]'), '');
    return newValue.copyWith(
      text: newText,
      selection: newText == newValue.text
          ? newValue.selection
          : TextSelection.collapsed(offset: newText.length),
    );
  }
}


class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    if (text.length == 2 && oldValue.text.length == 1) {
      return TextEditingValue(
        text: '$text/',
        selection: const TextSelection.collapsed(offset: 3),
      );
    } else if (text.length == 5) {
      final month = int.tryParse(text.substring(0, 2));
      final year = int.tryParse(text.substring(3, 5));
      if (month == null || month < 1 || month > 12 || year == null || year < 0) {
        return oldValue;
      }
    }
    return newValue;
  }
}