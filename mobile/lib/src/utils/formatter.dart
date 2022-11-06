import 'package:flutter/services.dart';

class LengthLimitingFormatter extends TextInputFormatter {
  LengthLimitingFormatter(this.max);

  final double max;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.length <= max) {
      return newValue;
    } else {
      return oldValue;
    }
  }
}

class KanaFormatter extends TextInputFormatter {
  KanaFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    bool containJapanese(String text) {
      return RegExp('[ぁ-ゔ]').hasMatch(text);
    }

    String hiraToKana(String str) {
      return str.replaceAllMapped(RegExp('[ぁ-ゔ]'),
          (Match m) => String.fromCharCode(m.group(0)!.codeUnitAt(0) + 0x60));
    }

    if (newValue.text == '') {
      return newValue;
    } else if (containJapanese(newValue.text)) {
      final kana = hiraToKana(newValue.text);
      return newValue.copyWith(text: kana);
    } else {
      return newValue;
    }
  }
}
