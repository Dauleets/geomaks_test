// ignore_for_file: avoid-dynamic
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geomaks_test/src/core/network/interfaces/base_client_generator.dart';

part 'auth_api.freezed.dart';

@freezed
class AuthApi extends BaseClientGenerator with _$AuthApi {
  const AuthApi._() : super();

  /// Запрос для полечение списка
  const factory AuthApi.getCity() = _GetCity;
  const factory AuthApi.getCountry() = _GetCountry;

  /// Запрос для авторизации
  const factory AuthApi.signIn({
    required String email,
    required String password,
    required String deviceToken,
  }) = _SignIn;


  /// Здесь описываются body для всех запросов
  /// По умолчанию null
  @override
  dynamic get body => whenOrNull(
      
        signIn: (email, password, deviceToken) => {
          'email': email,
          'password': password,
          // 'device_token': deviceToken,
        },
 
      );

  /// Используемые методы запросов, по умолчанию 'GET'
  @override
  String get method => maybeWhen(
        orElse: () => 'GET',
        // phoneLogin: (_) => 'POST',
        signIn: (email, password, deviceToken) => 'POST',
        signUp: (formData) => 'POST',
        getCity: () => 'GET',
        getCountry: () => 'GET',
        forgotPassword: (email) => 'POST',
      );

  /// Пути всех запросов (после [kBaseUrl])
  @override
  String get path => when(
        // phoneLogin: (_) => '/v1/auth/phone/',
        signIn: (email, password, deviceToken) => '/auth/login',
        signUp: (formData) => '/auth/register',
        getCity: () => '/list/cities',
        getCountry: () => '/list/countries',
        forgotPassword: (email) => '/client/auth/forgot_password',
      );

  @override
  Map<String, dynamic>? get queryParameters => whenOrNull(
        signIn: (email, password, deviceToken) => {},
        signUp: (formData) => {},
        getCity: () => {},
        getCountry: () => {},
        forgotPassword: (email) => {},
      );
}
