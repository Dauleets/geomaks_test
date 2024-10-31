 import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final MaskTextInputFormatter maskPhoneFormatter = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: {"#": RegExp('[0-9]')},
    type: MaskAutoCompletionType.eager,
  );