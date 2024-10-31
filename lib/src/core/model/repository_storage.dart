import 'package:geomaks_test/src/core/network/layers/network_executer.dart';
import 'package:geomaks_test/src/feature/auth/database/auth_dao.dart';


import 'package:geomaks_test/src/feature/settings/database/settings_dao.dart';
import 'package:geomaks_test/src/feature/settings/repository/settings_repository.dart';

import 'package:shared_preferences/shared_preferences.dart';

abstract class IRepositoryStorage {
  // dao's
  AuthDao get authDao;
  SettingsDao get settingsDao;

  // Repositories
  ISettingsRepository get settings;
  
  // IMainRepository get mainRepository;


  // Data sources

  // IMainRemoteDS get mainRemoteDS;
}

class RepositoryStorage implements IRepositoryStorage {
  // ignore: unused_field
  // final AppDatabase _appDatabase;
  final SharedPreferences _sharedPreferences;

  RepositoryStorage({
    // required AppDatabase appDatabase,
    required SharedPreferences sharedPreferences,
    required NetworkExecuter networkExecuter,
  })  : // _appDatabase = appDatabase,
        _sharedPreferences = sharedPreferences;

  ///
  /// Repositories
  ///

  @override
  ISettingsRepository get settings => SettingsRepository(
        settingsDao: SettingsDao(sharedPreferences: _sharedPreferences),
      );

 

  ///
  /// Remote datasources
  ///
  
  @override
  AuthDao get authDao => AuthDao(sharedPreferences: _sharedPreferences);

  @override
  SettingsDao get settingsDao =>
      SettingsDao(sharedPreferences: _sharedPreferences);
 
}
