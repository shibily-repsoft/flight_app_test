

part of 'flights_cubit.dart';



abstract class FlightsState {
  const FlightsState();
}

class FlightsInitial extends FlightsState {
  const FlightsInitial();
}

class FlightsLoading extends FlightsState {
  const FlightsLoading();
}

class FlightsLoaded extends FlightsState {
  final ApiResultModel<FlightEntity> flights;

  const FlightsLoaded(this.flights);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FlightsLoaded && o.flights == flights;
  }

  @override
  int get hashCode => flights.hashCode;
}

class FlightsError extends FlightsState {
  final String message;
  const FlightsError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FlightsError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}