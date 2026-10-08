import 'package:flight_app_test/core/utlis/mapper.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/flight_entitiy.dart';

part 'flight_modal.g.dart';

@JsonSerializable()
class FlightModal extends DataMapper<FlightEntity> {
  FlightModal({
    this.resultCount,
    this.currency,
    this.flightTrips,
  });

  factory FlightModal.fromJson(Map<String, dynamic> json) =>
      _$FlightModalFromJson(json);

  @JsonKey(name: 'resultCount')
  int? resultCount;

  @JsonKey(name: 'currency')
  String? currency;

  @JsonKey(name: 'flightTrips')
  List<FlightTripModal>? flightTrips;

  @override
  FlightEntity mapToEntity() {
    return FlightEntity(
      resultCount: resultCount ?? 0,
      currency: currency ?? '',
      flightTrips: flightTrips
              ?.map(
                (FlightTripModal trip) => trip.mapToEntity(),
              )
              .toList() ??
          [],
    );
  }
}

@JsonSerializable()
class FlightTripModal extends DataMapper<FlightTripEntity> {
  FlightTripModal({
    this.flightTripKey,
    this.fareDetails,
    this.flightJourneys,
    this.tripDuration,
    this.tripDirection,
  });

  factory FlightTripModal.fromJson(Map<String, dynamic> json) =>
      _$FlightTripModalFromJson(json);

  @JsonKey(name: 'flightTripKey')
  String? flightTripKey;

  @JsonKey(name: 'fareDetails')
  FareDetailsModal? fareDetails;

  @JsonKey(name: 'flightJourneys')
  List<FlightJourneyModal>? flightJourneys;

  @JsonKey(name: 'tripDuration')
  TripDurationModal? tripDuration;

  @JsonKey(name: 'tripDirection')
  int? tripDirection;

  @override
  FlightTripEntity mapToEntity() {
    return FlightTripEntity(
      flightTripKey: flightTripKey ?? '',
      fareDetails: fareDetails?.mapToEntity() ??
          FareDetailsEntity(
            currency: '',
            baseFare: '',
            tax: '',
            decimalPoint: 0,
            total: '',
          ),
      flightJourneys: flightJourneys
              ?.map(
                (FlightJourneyModal journey) => journey.mapToEntity(),
              )
              .toList() ??
          [],
      tripDuration: tripDuration?.mapToEntity() ??
          TripDuration(
            days: 0,
            hours: 0,
            minutes: 0,
          ),
      tripDirection: tripDirection ?? 0,
    );
  }
}

@JsonSerializable()
class TripDurationModal extends DataMapper<TripDuration> {
  TripDurationModal({
    this.days,
    this.hours,
    this.minutes,
  });

  factory TripDurationModal.fromJson(Map<String, dynamic> json) =>
      _$TripDurationModalFromJson(json);

  @JsonKey(name: 'days')
  int? days;

  @JsonKey(name: 'hours')
  int? hours;

  @JsonKey(name: 'minutes')
  int? minutes;

  @override
  TripDuration mapToEntity() {
    return TripDuration(
      days: days ?? 0,
      hours: hours ?? 0,
      minutes: minutes ?? 0,
    );
  }
}

@JsonSerializable()
class FlightJourneyModal extends DataMapper<FlightJourneyEntity> {
  FlightJourneyModal({
    this.journeyIdentifier,
    this.travelDirection,
    this.tripDuration,
    this.totalStops,
    this.flightItems,
    this.dayChange,
  });

  factory FlightJourneyModal.fromJson(Map<String, dynamic> json) =>
      _$FlightJourneyModalFromJson(json);

  @JsonKey(name: 'journeyIdentifier')
  JourneyIdentifier? journeyIdentifier;

  @JsonKey(name: 'travelDirection')
  int? travelDirection;

  @JsonKey(name: 'journeyTime')
  TripDurationModal? tripDuration;

  @JsonKey(name: 'totalStops')
  int? totalStops;

  @JsonKey(name: 'flightItems')
  List<FlightItemModal>? flightItems;

  @JsonKey(name: 'dayChange')
  bool? dayChange;

  @override
  FlightJourneyEntity mapToEntity() {
    return FlightJourneyEntity(
      journeyIdentifier:
          journeyIdentifier ?? JourneyIdentifier.values.first,
      travelDirection: travelDirection ?? 0,
      journeyTime: tripDuration?.mapToEntity() ??
          TripDuration(
            days: 0,
            hours: 0,
            minutes: 0,
          ),
      totalStops: totalStops ?? 0,
      flightItems: flightItems
              ?.map(
                (FlightItemModal item) => item.mapToEntity(),
              )
              .toList() ??
          [],
      dayChange: dayChange ?? false,
    );
  }
}

@JsonSerializable()
class FlightItemModal extends DataMapper<FlightItemEntity> {
  FlightItemModal({
    this.segmentIdentifier,
    this.departure,
    this.arrival,
    this.flightInfo,
    this.durationPerLeg,
    this.transitTime,
    this.numberOfStops,
  });

  factory FlightItemModal.fromJson(Map<String, dynamic> json) =>
      _$FlightItemModalFromJson(json);

  @JsonKey(name: 'segmentIdentifier')
  SegmentIdentifier? segmentIdentifier;

  @JsonKey(name: 'departure')
  ArrivalModal? departure;

  @JsonKey(name: 'arrival')
  ArrivalModal? arrival;

  @JsonKey(name: 'flightInfo')
  FlightInfoModal? flightInfo;

  @JsonKey(name: 'durationPerLeg')
  TripDurationModal? durationPerLeg;

  @JsonKey(name: 'transitTime')
  TripDurationModal? transitTime;

  @JsonKey(name: 'numberOfStops')
  int? numberOfStops;

  @override
  FlightItemEntity mapToEntity() {
    return FlightItemEntity(
      segmentIdentifier:
          segmentIdentifier ?? SegmentIdentifier.values.first,
      departure: departure?.mapToEntity() ??
          ArrivalEntity(
            airportCode: AirportCode.values.first,
            cityName: '',
            dateTime: DateTime.now(),
            terminal: '',
          ),
      arrival: arrival?.mapToEntity() ??
          ArrivalEntity(
            airportCode: AirportCode.values.first,
            cityName: '',
            dateTime: DateTime.now(),
            terminal: '',
          ),
      flightInfo: flightInfo?.mapToEntity() ??
          FlightInfoEntity(
            name: '',
            code: Code.values.first,
            number: '',
            cabinClass: CabinClass.values.first,
            equipmentNumber: '',
          ),
      durationPerLeg: durationPerLeg?.mapToEntity() ??
          TripDuration(
            days: 0,
            hours: 0,
            minutes: 0,
          ),
      transitTime: transitTime?.mapToEntity() ??
          TripDuration(
            days: 0,
            hours: 0,
            minutes: 0,
          ),
      numberOfStops: numberOfStops ?? 0,
    );
  }
}

@JsonSerializable()
class FlightInfoModal extends DataMapper<FlightInfoEntity> {
  FlightInfoModal({
    this.name,
    this.code,
    this.number,
    this.cabinClass,
    this.equipmentNumber,
  });

  factory FlightInfoModal.fromJson(Map<String, dynamic> json) =>
      _$FlightInfoModalFromJson(json);

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'code')
  Code? code;

  @JsonKey(name: 'number')
  String? number;

  @JsonKey(name: 'cabinClass')
  CabinClass? cabinClass;

  @JsonKey(name: 'equipmentNumber')
  String? equipmentNumber;

  @override
  FlightInfoEntity mapToEntity() {
    return FlightInfoEntity(
      name: name ?? '',
      code: code ?? Code.values.first,
      number: number ?? '',
      cabinClass: cabinClass ?? CabinClass.values.first,
      equipmentNumber: equipmentNumber ?? '',
    );
  }
}

@JsonSerializable()
class ArrivalModal extends DataMapper<ArrivalEntity> {
  ArrivalModal({
    this.airportCode,
    this.cityName,
    this.dateTime,
    this.terminal,
  });

  factory ArrivalModal.fromJson(Map<String, dynamic> json) =>
      _$ArrivalModalFromJson(json);

  @JsonKey(name: 'airportCode')
  AirportCode? airportCode;

  @JsonKey(name: 'cityName')
  String? cityName;

  @JsonKey(name: 'dateTime')
  DateTime? dateTime;

  @JsonKey(name: 'terminal')
  String? terminal;

  @override
  ArrivalEntity mapToEntity() {
    return ArrivalEntity(
      airportCode: airportCode ?? AirportCode.values.first,
      cityName: cityName ?? '',
      dateTime: dateTime ?? DateTime.now(),
      terminal: terminal ?? '',
    );
  }
}

@JsonSerializable()
class FareDetailsModal extends DataMapper<FareDetailsEntity> {
  FareDetailsModal({
    this.currency,
    this.baseFare,
    this.tax,
    this.decimalPoint,
    this.total,
  });

  factory FareDetailsModal.fromJson(Map<String, dynamic> json) =>
      _$FareDetailsModalFromJson(json);

  @JsonKey(name: 'currency')
  String? currency;

  @JsonKey(name: 'baseFare')
  String? baseFare;

  @JsonKey(name: 'tax')
  String? tax;

  @JsonKey(name: 'decimalPoint')
  int? decimalPoint;

  @JsonKey(name: 'total')
  String? total;

  @override
  FareDetailsEntity mapToEntity() {
    return FareDetailsEntity(
      currency: currency ?? '',
      baseFare: baseFare ?? '',
      tax: tax ?? '',
      decimalPoint: decimalPoint ?? 0,
      total: total ?? '',
    );
  }
}