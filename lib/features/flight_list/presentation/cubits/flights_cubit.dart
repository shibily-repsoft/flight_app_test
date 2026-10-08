import 'package:flight_app_test/core/entities/api_result_model.dart';
import 'package:flight_app_test/features/flight_list/data/repository/flights_repo_impl.dart';
import 'package:flight_app_test/features/flight_list/domain/entities/flight_entitiy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'flights_state.dart';

class FlightsCubit extends Cubit<FlightsState> {
  FlightsCubit(this._flightsRepository)
      : super(const FlightsInitial());

  final FlightsRepository _flightsRepository;

  Future<void> getFlights() async {
    try {
      emit(const FlightsLoading());

      final ApiResultModel<FlightEntity> flights =
          await _flightsRepository.getFlights();

      emit(FlightsLoaded(flights));
    } catch (e, stackTrace) {
      print('❌ FlightsCubit Error: $e');
      print(stackTrace);

      emit(
        FlightsError(
          e.toString(),
        ),
      );
    }
  }
}