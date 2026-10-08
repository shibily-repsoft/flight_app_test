import 'package:flight_app_test/core/entities/api_result_model.dart';
import 'package:flight_app_test/features/flight_list/data/modals/flight_modal.dart';
import 'package:flight_app_test/features/flight_list/data/repository/flights_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'flights_state.dart';

@injectable
class FlightsCubit extends Cubit<FlightsState> {
  FlightsCubit(this._flightsRepository)
      : super(const FlightsInitial());

  final FlightsRepository _flightsRepository;

  Future<void> getFlights() async {
    try {
      emit(const FlightsLoading());

      final ApiResultModel<FlightModal> flights =
          await _flightsRepository.getFlights();

      emit(FlightsLoaded(flights));
    } catch (e, stackTrace) {
      print('❌ FlightsCubit Error: $e');
      print(stackTrace);

      emit(FlightsError(e.toString()));
    }
  }
}