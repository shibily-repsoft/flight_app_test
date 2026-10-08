import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'api_result_model.freezed.dart';

@freezed
class ApiResultModel<T> with _$ApiResultModel<T> {
  const factory ApiResultModel.success({required T data}) = Success<T>;

  const factory ApiResultModel.failure(
      {required ErrorResultModel errorResultEntity}) = Failure<T>;
}

class ErrorResultModel extends Equatable {
  const ErrorResultModel({
    this.statusCode,
    this.message,
  });

  final int? statusCode;
  final String? message;

  @override
  List<Object?> get props => <Object?>[
        statusCode,
        message,
      ];
}