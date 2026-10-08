import 'package:flight_app_test/core/entities/api_result_model.dart';
import 'package:flight_app_test/features/flight_list/data/modals/flight_modal.dart';

abstract class FlightsRemoteDataSource {
  Future<ApiResultModel<FlightModal?>> getFlightsData();


}

