
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geomaks_test/src/feature/app/enum/app_language.dart';
import 'package:geomaks_test/src/feature/settings/enum/app_theme.dart';

part 'settings_data.freezed.dart';

@freezed
class SettingsData with _$SettingsData {
  factory SettingsData({
    required AppTheme theme,
    required AppLanguage locale,
  }) = _SettingsData;
}
