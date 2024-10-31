import 'package:geomaks_test/src/core/database/shared_prefernces/typed_preferences_dao.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IAuthDao {
  PreferencesEntry<String> get user;

  PreferencesEntry<bool> get onboarding;

  PreferencesEntry<String> get pinCode;

  PreferencesEntry<String> get deviceToken;

  PreferencesEntry<String> get address;

  PreferencesEntry<String> get payment;

  PreferencesEntry<bool> get moderate;
}

class AuthDao extends TypedPreferencesDao implements IAuthDao {
  AuthDao({
    required SharedPreferences sharedPreferences,
  }) : super(sharedPreferences, name: 'auth');

  @override
  PreferencesEntry<String> get user => stringEntry('user');

  @override
  PreferencesEntry<bool> get moderate => boolEntry('moderateCurrier');

  @override
  PreferencesEntry<bool> get onboarding => boolEntry('onboarding');

  @override
  PreferencesEntry<String> get pinCode => stringEntry('pincode');

  @override
  PreferencesEntry<String> get deviceToken => stringEntry('deviceToken');

  @override
  PreferencesEntry<String> get address => stringEntry('address');

  @override
  PreferencesEntry<String> get payment => stringEntry('payment');
}
