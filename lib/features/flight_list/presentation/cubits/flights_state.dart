

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
  final ApiResultModel<FlightModal> flights;

  const FlightsLoaded(this.flights);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FlightsLoaded && other.flights == flights;
  }

  @override
  int get hashCode => flights.hashCode;
}

class FlightsError extends FlightsState {
  final String message;
  const FlightsError(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FlightsError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}