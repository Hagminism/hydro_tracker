import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T, E> with _$Result<T, E> {
  const factory Result.success(T value) = Success<T, E>;

  const factory Result.failure(E error) = Failure<T, E>;
}
