// ignore_for_file: constant_identifier_names

import 'package:geomaks_test/src/core/extension/src/build_context.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

Widget refreshClassicHeader(BuildContext context) {
  return const ClassicHeader(
    completeText: 'Успешно обновлено!',
    releaseText: 'Обновить!',
    idleText: 'Потяните вниз, чтобы обновить',
    failedText: 'Неизвестная ошибка',
    refreshingText: 'Обновление...',
  );
}

const NOT_FOUND_IMAGE =
    'https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png';

const NO_IMAGE_AVAILABLE =
    'https://propertywiselaunceston.com.au/wp-content/themes/property-wise/images/no-image@2x.png';



Widget refreshClassicFooter(BuildContext context) {
  return const ClassicFooter(
    // completeDuration: 'Успешно обновлено!',
    // // releaseText: 'Обновить!',

    idleText: 'Потяните вниз, чтобы обновить',
    failedText: 'Неизвестная ошибка',
    loadingText: 'Загружаем...',
    canLoadingText: 'Обновление...',
    idleIcon: null,
  );
}

Widget errorText(BuildContext context, {required String? text}) {
  if (text == null) return const SizedBox();
  return Text(
    text,
    style: TextStyle(
      fontSize: 13,
      color: context.theme.colorScheme.error,
    ),
  );
}
