import 'package:equatable/equatable.dart';
import 'package:flight_app_test/core/entities/api_result_model.dart';

abstract class BaseParamsUseCase<Type, Request> {
  Future<ApiResultModel<Type>> call(Request? params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => <Object>[];
}