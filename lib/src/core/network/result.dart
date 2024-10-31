import 'package:geomaks_test/src/core/error/network_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  /// Create an `Success` result with the given value
  const factory Result.success(T data) = _Success<T>;

  /// Create an `Failure` result with the given Exception
  const factory Result.failure(NetworkException error) = _Failure<T>;
}

extension ResultExt<T> on Result<T> {
  bool get success => when(success: (_) => true, failure: (e) => false);

  T? get data => whenOrNull(success: (data) => data);

  bool get hasError => when(success: (_) => false, failure: (e) => true);

  NetworkException? get error => whenOrNull(failure: (e) => e);
}
