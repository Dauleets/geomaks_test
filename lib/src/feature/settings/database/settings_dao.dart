import 'package:geomaks_test/src/core/database/shared_prefernces/typed_preferences_dao.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ISettingsDao {
  PreferencesEntry<String> get themeMode;

  PreferencesEntry<String> get locale;

  PreferencesEntry<String> get currentCity;
}

class SettingsDao extends TypedPreferencesDao implements ISettingsDao {
  SettingsDao({
    required SharedPreferences sharedPreferences,
  }) : super(sharedPreferences, name: 'settings');

  @override
  PreferencesEntry<String> get themeMode => stringEntry('theme_mode');

  @override
  PreferencesEntry<String> get locale => stringEntry('locale');

  @override
  PreferencesEntry<String> get currentCity => stringEntry('current_city');
}
