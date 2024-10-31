// ignore_for_file: unused_field, duplicate_ignore

import 'dart:convert';
import 'dart:developer';

import 'package:geomaks_test/src/core/error/network_exception.dart';
import 'package:geomaks_test/src/core/network/layers/network_executer.dart';
import 'package:geomaks_test/src/core/network/result.dart';
import 'package:geomaks_test/src/feature/app/model/dto/user/user_dto.dart';
import 'package:geomaks_test/src/feature/auth/database/auth_dao.dart';
import 'package:geomaks_test/src/feature/auth/datasource/auth_remote_ds.dart';
import 'package:geomaks_test/src/feature/settings/database/settings_dao.dart';

abstract class IAuthRepository {
  /// Статус аутентификации
  bool get isAuthenticated;

  ///
  /// <-- Local methods -->
  ///
  bool getOnboarding();

  Future<void> setOnboarding({
    required bool onboarding,
  });

  String? getPinCode();

  Future<bool> setPinCode({
    required String pincode,
  });

  Future<bool> clearUser();

  Future<bool> clearPincode();
  UserDTO? getUserFromCache();

  ///
  /// <-- Server methods -->
  ///
  ///
  Future<Result<UserDTO>> signIn({
    required String email,
    required String password,
  });
}

///////// Repo Implementation //////////
class AuthRepositoryImpl extends IAuthRepository {
  // ignore: unused_field
  final IAuthRemoteDS _remoteDS;
  final IAuthDao _authDao;
  final ISettingsDao _settingsDao;
  final NetworkExecuter _client;

  @override
  bool get isAuthenticated => _authDao.user.value != null;

  AuthRepositoryImpl({
    required IAuthRemoteDS remoteDS,
    required IAuthDao authDao,
    required NetworkExecuter client,
    required ISettingsDao settingsDao,
  })  : _remoteDS = remoteDS,
        _authDao = authDao,
        _settingsDao = settingsDao,
        _client = client;

  ///
  /// <-- Local methods -->
  ///

  @override
  bool getOnboarding() => _authDao.onboarding.value ?? false;

  @override
  Future<void> setOnboarding({
    required bool onboarding,
  }) async =>
      _authDao.onboarding.setValue(onboarding);

  @override
  UserDTO? getUserFromCache() {
    try {
      if (_authDao.user.value != null) {
        final UserDTO user = UserDTO.fromJson(
            jsonDecode(_authDao.user.value!) as Map<String, dynamic>);
        return user;
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'getUserFromCache()');
    }
    return null;
  }

  @override
  String? getPinCode() => _authDao.pinCode.value;

  @override
  Future<bool> setPinCode({
    required String pincode,
  }) =>
      _authDao.pinCode.setValue(pincode);

  @override
  Future<bool> clearUser() async => _authDao.user.remove();

  @override
  Future<bool> clearPincode() async => _authDao.pinCode.remove();

  ///
  /// <-- Server methods -->
  ///

  @override
  Future<Result<UserDTO>> signIn({
    required String email,
    required String password,
  }) async {
    final Result<UserDTO> result = await _remoteDS.signIn(
      email: email,
      password: password,
    );

    result.whenOrNull(
      success: (user) async {
        await _authDao.user.setValue(
          jsonEncode(
            user.toJson(),
          ),
        );
      },
      failure: (NetworkException exception) => Result<bool?>.failure(exception),
    );

    return result;
  }
}
