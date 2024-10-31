// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:geomaks_test/src/core/error/network_exception.dart';
import 'package:geomaks_test/src/core/network/layers/network_executer.dart';
import 'package:geomaks_test/src/core/network/result.dart';
import 'package:geomaks_test/src/core/utils/error_util.dart';
import 'package:geomaks_test/src/feature/app/model/dto/user/user_dto.dart';
import 'package:geomaks_test/src/feature/auth/database/auth_dao.dart';
import 'package:geomaks_test/src/feature/auth/datasource/auth_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:l/l.dart';
import 'package:path_provider/path_provider.dart';

abstract class IAuthRemoteDS {
  Future<Result<UserDTO>> signIn({
    required String email,
    required String password,
  });
}

///////// DS Implementation //////////
class AuthRemoteDSImpl implements IAuthRemoteDS {
  final NetworkExecuter client;
  final IAuthDao _authDao;

  AuthRemoteDSImpl({
    required this.client,
    required IAuthDao authDao,
  }) : _authDao = authDao;

  // ignore: unused_element
  Future<Result<T>> _catchError<T>(
    String label,
    Object e,
    StackTrace stackTrace,
  ) async {
    if (kDebugMode) {
      l.d('$label => ${NetworkException.type(error: e.toString())}');

      await ErrorUtil.logError(
        e,
        stackTrace: stackTrace,
        hint: '$label => ${NetworkException.type(error: e.toString())}',
      );
    }

    return Result<T>.failure(
      NetworkException.type(error: e.toString()),
    );
  }

  @override
  Future<Result<UserDTO>> signIn({
    required String email,
    required String password,
  }) async {
    final String deviceToken = _authDao.deviceToken.value ?? '';
    try {
      final Result<Map<String, dynamic>?> result = await client.produce(
        route: AuthApi.signIn(
          email: email,
          password: password,
          deviceToken: deviceToken,
        ),
      );

      return result.when(
        success: (Map<String, dynamic>? response) {
          if (response == null) {
            return const Result.failure(
              NetworkException.type(),
            );
          }

          final UserDTO user = UserDTO.fromJson(response);

          return Result<UserDTO>.success(user);
        },
        failure: (NetworkException exception) =>
            Result<UserDTO>.failure(exception),
      );
    } catch (e) {
      if (kDebugMode) {
        l.d('signIn => ${NetworkException.type(error: e.toString())}');
      }
      return Result<UserDTO>.failure(
        NetworkException.type(error: e.toString()),
      );
    }
  }
}
