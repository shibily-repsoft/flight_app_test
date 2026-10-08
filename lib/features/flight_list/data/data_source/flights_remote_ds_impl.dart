import 'dart:convert';

import 'package:flight_app_test/core/entities/api_result_model.dart';
import 'package:flight_app_test/core/utlis/api_call_helper.dart';
import 'package:flight_app_test/features/flight_list/data/modals/flight_modal.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import 'flights_remote_ds.dart';

@Injectable(as: FlightsRemoteDataSource)
class FlightsRemoteDataSourceImpl implements FlightsRemoteDataSource {
  FlightsRemoteDataSourceImpl(this._apiCallHelper);

  final ApiCallHelper _apiCallHelper;

  @override
  Future<ApiResultModel<FlightModal?>> getFlightsData(
      {String? cityName}) async {
    try {
      final ApiResultModel<Response> _result = await _apiCallHelper.getWS(
          uri: "/results.json",
         );
      return await _result.when(
        success: (Response response) {
          return ApiResultModel<FlightModal?>.success(
            data: FlightModal.fromJson(
            JsonDecoder().convert(response.body),
            ),
          );
        },
        failure: (ErrorResultModel errorModel) {
          return ApiResultModel<FlightModal?>.failure(
              errorResultEntity: errorModel);
        },
      );
    } on CustomConnectionException catch (exception) {
      throw CustomConnectionException(
        exceptionMessage: exception.exceptionMessage,
        exceptionCode: exception.exceptionCode,
      );
    }
  }
}
