import 'package:geomaks_test/src/core/common/constants.dart';

extension StringExtension on String {
  bool emailValidator() {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(this);
  }

  bool oneDigit() {
    return RegExp(
      r"^.*\d.*",
    ).hasMatch(this);
  }

  bool atLeastOneUpperAndOneLowerAZ() {
    return RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z]).+$",
    ).hasMatch(this);
  }

  bool upperAndLowerAZ() {
    return RegExp(
      r"^.*[A-Za-z\s].*",
    ).hasMatch(this);
  }

  bool oneSpecialChar() {
    return RegExp(
      r"^.*[^\A-Z0-9\a-z0-9\А-Я0-9\а-я0-9\u04D8\u04D9\u04B0\u04B1\u0406\u0456\u04A2\u04A3\u0492\u0493\u04AE\u04AF\u049A\u049B\u04E8\u04E9\u04BA\u04BB].*",
    ).hasMatch(this);
  }

  bool numberValidator() {
    if (length == 11) {
      return RegExp(
        r'^[0-9]{11}$',
      ).hasMatch(this);
    }
    return RegExp(
      r'^[0-9]{10}$',
    ).hasMatch(this);
  }

  bool isPhone() =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{5,5}$')
          .hasMatch(this);

  bool isOnlyDigits() {
    if (startsWith('+')) {
      return RegExp(
        r'^[\+]?[0-9]',
      ).hasMatch(this);
    }

    return false;
  }

  bool isNumeric() {
    return double.tryParse(this) != null;
  }
}

extension NullableImageExtension on String? {
  ///
  /// returns true if the link is correct, otherwise false,
  /// if false then you need to show the local placeholder widget
  /// 
  /// TODO: Create env file 
  // bool handleProfileImage(BuildContext context) {
  //   if (this == null || this == kHubBaseDevUrl || this == kHubBaseProdUrl) {
  //     return false;
  //   } else {
  //     return this!.isNotEmpty;
  //   }
  // }

  String handleImage() {
    if (this != null && this!.isNotEmpty) {
      return this!;
    } else {
      return NO_IMAGE_AVAILABLE;
    }
  }

  String? handleNullableImage() {
    if (this != null && this!.isNotEmpty) {
      return this!;
    } else {
      return null;
    }
  }

  String? addNewLine({
    required String word,
  }) {
    if (this != null && this!.isNotEmpty) {
      if (this!.contains(word)) {
        final int index = this!.indexOf(word);
        final StringBuffer stringBuffer = StringBuffer();
        stringBuffer.write(this!.substring(0, index));
        stringBuffer.writeln();
        stringBuffer.write(this!.substring(index, this!.length));
        return stringBuffer.toString();
      } else {
        return this!;
      }
    } else {
      return null;
    }
  }

  String? getLine({
    required int index,
  }) {
    if (this != null && this!.isNotEmpty) {
      final list = this!.split(',');
      final StringBuffer first = StringBuffer();
      final StringBuffer second = StringBuffer();
      for (int i = 0; i < list.length; i++) {
        if (i >= 2) {
          second.write(list[i]);
          if (i != list.length - 1) {
            second.write(',');
          }
        } else {
          first.write(list[i]);
          first.write(',');
        }
      }
      if (index == 0) {
        return first.toString();
      } else {
        return second.toString();
      }
    } else {
      return null;
    }
  }

  int nullableLentgh() {
    if (this == null) {
      return 0;
    } else {
      return this!.length;
    }
  }

  bool nullableContains(String value) {
    if (this == null) {
      return false;
    } else {
      return this!.contains(value);
    }
  }
}
