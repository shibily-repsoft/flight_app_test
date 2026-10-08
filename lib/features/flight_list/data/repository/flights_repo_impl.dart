import 'package:flight_app_test/core/entities/api_result_model.dart';
import 'package:flight_app_test/features/flight_list/data/data_source/flights_remote_ds.dart';
import 'package:flight_app_test/features/flight_list/data/modals/flight_modal.dart';
import 'package:flight_app_test/features/flight_list/data/repository/flights_repo.dart';
import 'package:injectable/injectable.dart';

export 'package:flight_app_test/features/flight_list/data/repository/flights_repo.dart';

@LazySingleton(as: FlightsRepository)
class FlightsRepositoryImpl implements FlightsRepository {
  FlightsRepositoryImpl(this._flightsRemoteDataSource);

  final FlightsRemoteDataSource _flightsRemoteDataSource;

  @override
  Future<ApiResultModel<FlightModal>> getFlights() async {
    try {
      final result =
          await _flightsRemoteDataSource.getFlightsData();

      return await result.when(
        success: (data) async {
          if (data != null) {
            return ApiResultModel<FlightModal>.success(
              data: data,
            );
          }

          return const ApiResultModel<FlightModal>.failure(
            errorResultEntity: ErrorResultModel(
              message: 'No flights found',
            ),
          );
        },
        failure: (error) async {
          return ApiResultModel<FlightModal>.failure(
            errorResultEntity: error,
          );
        },
      );
    } catch (error) {
      return ApiResultModel<FlightModal>.failure(
        errorResultEntity: ErrorResultModel(
          message: error.toString(),
        ),
      );
    }
  }
}