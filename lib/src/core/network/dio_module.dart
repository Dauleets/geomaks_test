// ignore_for_file: avoid_classes_with_only_static_members, avoid_redundant_argument_values, unused_import

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:geomaks_test/src/feature/app/enum/app_language.dart';
import 'package:geomaks_test/src/feature/app/logic/not_auth_logic.dart';
import 'package:geomaks_test/src/feature/app/model/dto/user/user_dto.dart';
import 'package:geomaks_test/src/feature/auth/database/auth_dao.dart';
import 'package:geomaks_test/src/feature/settings/database/settings_dao.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// Creates new `Dio` instance
@sealed
class DioModule {
  DioModule._();

  /// Конфигурация Dio
  static Dio configureDio({
    required AuthDao authDao,
    required PackageInfo packageInfo,
    required ISettingsDao settings,
  }
      // IUserRepository userRepository,
      ) {
    final dio = Dio();

    /// TODO: env file add = kBaseUrl
    dio
      ..options.baseUrl = ''
      ..options.headers.addAll({
        'accept': 'application/json',
        'version': packageInfo.version,
        'Content-Language':
            settings.locale.value ?? AppLanguage.deviceLanguage().localeCode,
      })
      ..interceptors.addAll([
        // LogOutInterceptor(userRepository),
        _AuthDioInterceptor(authDao, settings),
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          compact: true,
          maxWidth: 200,
        ),
      ]);

    return dio;
  }
}

class _AuthDioInterceptor extends Interceptor {
  final AuthDao _authDao;
  final ISettingsDao settings;
  _AuthDioInterceptor(this._authDao, this.settings);

  // Dio dio = Dio(BaseOptions(baseUrl: SERVER_));

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String? userStr = _authDao.user.value;
    if (userStr != null) {
      final UserDTO user =
          UserDTO.fromJson(jsonDecode(userStr) as Map<String, dynamic>);
      if (user.accessToken != null) {
        options.headers['Authorization'] = 'Bearer ${user.accessToken}';
      }
    }

    // if (kDebugMode) options.headers['USERR'] = "$userStr";
    options.headers['Accept'] = "application/json";
    options.headers['lang'] = settings.locale.value ?? "ru";

    // options.headers['Content-Language'] = locale.replaceAll('kk', 'kz');
    super.onRequest(options, handler);
  }

  @override
  Future onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if ((err.response?.statusCode ?? 0) == HttpStatus.unauthorized) {
      NotAuthLogic().statusSubject.add(401);
    } else if ((err.response?.statusCode ?? 0) ==
        HttpStatus.unprocessableEntity) {
    } else if ((err.response?.statusCode ?? 0) == HttpStatus.notFound) {}
    return super.onError(err, handler);
  }
}
