import 'package:equatable/equatable.dart';

class FlightEntity extends Equatable {
  final int? resultCount;
    final String? currency;
    final List<FlightTripEntity>? flightTrips;

   const FlightEntity({
         this.resultCount,
         this.currency,
         this.flightTrips,
    });

  @override
  List <Object?> get props => [resultCount, currency, flightTrips];
}


class FlightTripEntity  extends Equatable {
    final String flightTripKey;
    final FareDetailsEntity fareDetails;
    final List<FlightJourneyEntity> flightJourneys;
    final TripDuration tripDuration;
    final int tripDirection;

    const FlightTripEntity({
        required this.flightTripKey,
        required this.fareDetails,
        required this.flightJourneys,
        required this.tripDuration,
        required this.tripDirection,
    });
 
  @override
  List <Object?> get props => [flightTripKey, fareDetails, flightJourneys, tripDuration, tripDirection];

  

}
class FareDetailsEntity extends Equatable {
    final String currency;
    final String baseFare;
    final String tax;
    final int decimalPoint;
    final String total;

    const FareDetailsEntity({
        required this.currency,
        required this.baseFare,
        required this.tax,
        required this.decimalPoint,
        required this.total,
    });

  @override
  List<Object?> get props => [currency, baseFare, tax, decimalPoint, total];

}
class FlightJourneyEntity extends Equatable {
    final JourneyIdentifier journeyIdentifier;
    final int travelDirection;
    final TripDuration journeyTime;
    final int totalStops;
    final List<FlightItemEntity> flightItems;
    final bool dayChange;

    const FlightJourneyEntity({
        required this.journeyIdentifier,
        required this.travelDirection,
        required this.journeyTime,
        required this.totalStops,
        required this.flightItems,
        required this.dayChange,
    });
  @override
  List<Object?> get props => [journeyIdentifier, travelDirection, journeyTime, totalStops, flightItems, dayChange];
}

class FlightItemEntity extends Equatable {
    final SegmentIdentifier segmentIdentifier;
    final ArrivalEntity departure;
    final ArrivalEntity arrival;
    final FlightInfoEntity flightInfo;
    final TripDuration durationPerLeg;
    final TripDuration transitTime;
    final int numberOfStops;

    const FlightItemEntity({
        required this.segmentIdentifier,
        required this.departure,
        required this.arrival,
        required this.flightInfo,
        required this.durationPerLeg,
        required this.transitTime,
        required this.numberOfStops,
    });
  @override
  List<Object?> get props => [segmentIdentifier, departure, arrival, flightInfo, durationPerLeg, transitTime, numberOfStops];
}

class ArrivalEntity extends Equatable {
    final AirportCode airportCode;
    final String cityName;
    final DateTime dateTime;
    final String terminal;

    const ArrivalEntity({
        required this.airportCode,
        required this.cityName,
        required this.dateTime,
        required this.terminal,
    });
   @override
  List<Object?> get props => [airportCode, cityName, dateTime, terminal];
}


class TripDuration {
    final int days;
    final int hours;
    final int minutes;

    TripDuration({
        required this.days,
        required this.hours,
        required this.minutes,
    });

}

class FlightInfoEntity extends Equatable {
    final String name;
    final Code code;
    final String number;
    final CabinClass cabinClass;
    final String equipmentNumber;

    const FlightInfoEntity({
        required this.name,
        required this.code,
        required this.number,
        required this.cabinClass,
        required this.equipmentNumber,
    });
    @override
    List<Object?> get props => [name, code, number, cabinClass, equipmentNumber];

}

enum AirportCode {
    DXB,
    KWI
}


enum Ar {
    AR,
    EMPTY,
    FLUFFY,
    PURPLE,
    TENTACLED
}

enum En {
    DUBAI,
    EMIRATES_AIRLINES,
    JAZEERA_AIRWAYS,
    KUWAIT,
    KUWAIT_AIRWAYS
}


enum CabinClass {
    Y
}

enum Code {
    EK,
    J9,
    KU
}

enum SegmentIdentifier {
    SG_001001,
    SG_002001
}

enum JourneyIdentifier {
    JN_001,
    JN_002
}