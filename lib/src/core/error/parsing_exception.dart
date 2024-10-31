import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

String parseDioError(DioException error) {
  switch (error.response?.statusCode) {
    case HttpStatus.unauthorized:
      return 'Not authorized. Please log in again!';
    case HttpStatus.notFound:
      // Handle custom error message from the server
      return (error.response?.data as Map<String, dynamic>)['message'] ?? 
             'The content you are looking for has not been found!';
    case HttpStatus.requestEntityTooLarge:
      return 'Request Entity Too Large';
    case HttpStatus.internalServerError:
      return 'Something is wrong with our servers, the problem will be solved soon!';
    default:
      try {
        return ((error.response?.data as Map<String, dynamic>)['message'] as String?) ?? 'Unknown error';
      } catch (e) {
        if (kDebugMode) print(e);
        return 'Unknown - $e';
      }
  }
}
