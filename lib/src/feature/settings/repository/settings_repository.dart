import 'package:geomaks_test/src/feature/app/enum/app_language.dart';
import 'package:geomaks_test/src/feature/app/model/dto/settings_data.dart';
import 'package:geomaks_test/src/feature/settings/database/settings_dao.dart';
import 'package:geomaks_test/src/feature/settings/enum/app_theme.dart';

import 'package:pure/pure.dart';

abstract class ISettingsRepository {
  SettingsData currentData();

  Future<void> setTheme(AppTheme value);

  Future<void> setLocale(AppLanguage locale);




}

class SettingsRepository implements ISettingsRepository {
  final ISettingsDao _settingsDao;

  SettingsRepository({
    required ISettingsDao settingsDao,
  }) : _settingsDao = settingsDao;

  AppTheme? get _theme =>
      AppTheme.values.byName.nullable(_settingsDao.themeMode.value);

  @override
  SettingsData currentData() {
    if (_settingsDao.locale.value == null) {
      setLocale(AppLanguage.deviceLanguage());
    }

    return SettingsData(
      theme: _theme ?? AppTheme.system,
      locale: _settingsDao.locale.value != null
          ? AppLanguage.fromString(_settingsDao.locale.value!)
          : AppLanguage.deviceLanguage(),
    );
  }

  @override
  Future<void> setTheme(AppTheme value) =>
      _settingsDao.themeMode.setValue(value.name);

  @override
  Future<void> setLocale(AppLanguage locale) =>
      _settingsDao.locale.setValue(locale.name);

  
}
