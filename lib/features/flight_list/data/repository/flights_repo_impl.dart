import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flight_app_test/core/entities/api_result_model.dart';
import 'package:flight_app_test/core/utlis/api_call_helper.dart';
import 'package:flight_app_test/core/utlis/connectvity_helper.dart';
import 'package:flight_app_test/features/flight_list/data/data_source/flights_remote_ds_impl.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/flight_entitiy.dart';
import '../data_source/flights_remote_ds.dart';

@injectable
class FlightsRepositoryImpl implements FlightsRepository {
  final FlightsRemoteDataSource _flightsRemoteDataSource;
  FlightsRepositoryImpl(this._flightsRemoteDataSource);

  Future<ApiResultModel<FlightEntity>> getFlights() async {
    try{
      var result = await _flightsRemoteDataSource.getFlightsData();
      return await result.when(
        success: (data) {
          if (data != null) {
            return ApiResultModel.success(data: data as FlightEntity);
          } else {
            return ApiResultModel.failure(
              errorResultEntity: ErrorResultModel(message: "No flights found"),
            );
          }
        },
        failure: (error) {
          return ApiResultModel.failure(errorResultEntity: error);
        },
      );
    } on FlutterError catch(error) {
      return ApiResultModel.failure(errorResultEntity: ErrorResultModel(message: error.toString()));
    }
  }
}

class FlightsRepository {
  Future<ApiResultModel<FlightEntity>> getFlights() async {
 final flightsRepositoryImpl = FlightsRepositoryImpl(FlightsRemoteDataSourceImpl(ApiCallHelper(ConnectivityCheckerHelper())));
    return await flightsRepositoryImpl.getFlights();     
  }
}

