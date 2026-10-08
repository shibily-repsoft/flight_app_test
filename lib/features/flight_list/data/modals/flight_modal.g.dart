// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightModal _$FlightModalFromJson(Map<String, dynamic> json) => FlightModal(
  resultCount: (json['resultCount '] as num?)?.toInt(),
  currency: json['currency'] as String?,
  flightTrips: (json['flightTrips'] as List<dynamic>?)
      ?.map((e) => FlightTripModal.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FlightModalToJson(FlightModal instance) =>
    <String, dynamic>{
      'resultCount ': instance.resultCount,
      'currency': instance.currency,
      'flightTrips': instance.flightTrips,
    };

FlightTripModal _$FlightTripModalFromJson(Map<String, dynamic> json) =>
    FlightTripModal(
      flightTripKey: json['flightTripKey'] as String?,
      fareDetails: json['fareDetails'] == null
          ? null
          : FareDetailsModal.fromJson(
              json['fareDetails'] as Map<String, dynamic>,
            ),
      flightJourneys: (json['flightJourneys'] as List<dynamic>?)
          ?.map((e) => FlightJourneyModal.fromJson(e as Map<String, dynamic>))
          .toList(),
      tripDuration: json['tripDuration'] == null
          ? null
          : TripDurationModal.fromJson(
              json['tripDuration'] as Map<String, dynamic>,
            ),
      tripDirection: (json['tripDirection'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FlightTripModalToJson(FlightTripModal instance) =>
    <String, dynamic>{
      'flightTripKey': instance.flightTripKey,
      'fareDetails': instance.fareDetails,
      'flightJourneys': instance.flightJourneys,
      'tripDuration': instance.tripDuration,
      'tripDirection': instance.tripDirection,
    };

TripDurationModal _$TripDurationModalFromJson(Map<String, dynamic> json) =>
    TripDurationModal(
      days: (json['days'] as num?)?.toInt(),
      hours: (json['hours'] as num?)?.toInt(),
      minutes: (json['minutes'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TripDurationModalToJson(TripDurationModal instance) =>
    <String, dynamic>{
      'days': instance.days,
      'hours': instance.hours,
      'minutes': instance.minutes,
    };

FlightJourneyModal _$FlightJourneyModalFromJson(Map<String, dynamic> json) =>
    FlightJourneyModal(
        journeyIdentifier: $enumDecodeNullable(
          _$JourneyIdentifierEnumMap,
          json['journeyIdentifier'],
        ),
        travelDirection: (json['travelDirection'] as num?)?.toInt(),
      )
      ..tripDuration = json['journeyTime'] == null
          ? null
          : TripDurationModal.fromJson(
              json['journeyTime'] as Map<String, dynamic>,
            )
      ..totalStops = (json['totalStops'] as num?)?.toInt()
      ..flightItems = (json['flightItems'] as List<dynamic>?)
          ?.map((e) => FlightItemModal.fromJson(e as Map<String, dynamic>))
          .toList()
      ..dayChange = json['dayChange'] as bool?;

Map<String, dynamic> _$FlightJourneyModalToJson(
  FlightJourneyModal instance,
) => <String, dynamic>{
  'journeyIdentifier': _$JourneyIdentifierEnumMap[instance.journeyIdentifier],
  'travelDirection': instance.travelDirection,
  'journeyTime': instance.tripDuration,
  'totalStops': instance.totalStops,
  'flightItems': instance.flightItems,
  'dayChange': instance.dayChange,
};

const _$JourneyIdentifierEnumMap = {
  JourneyIdentifier.JN_001: 'JN_001',
  JourneyIdentifier.JN_002: 'JN_002',
};

FlightItemModal _$FlightItemModalFromJson(
  Map<String, dynamic> json,
) => FlightItemModal(
  segmentIdentifier: $enumDecodeNullable(
    _$SegmentIdentifierEnumMap,
    json['segmentIdentifier'],
  ),
  departure: json['departure'] == null
      ? null
      : ArrivalModal.fromJson(json['departure'] as Map<String, dynamic>),
  arrival: json['arrival'] == null
      ? null
      : ArrivalModal.fromJson(json['arrival'] as Map<String, dynamic>),
  flightInfo: json['flightInfo'] == null
      ? null
      : FlightInfoModal.fromJson(json['flightInfo'] as Map<String, dynamic>),
  durationPerLeg: json['durationPerLeg'] == null
      ? null
      : TripDurationModal.fromJson(
          json['durationPerLeg'] as Map<String, dynamic>,
        ),
  transitTime: json['transitTime'] == null
      ? null
      : TripDurationModal.fromJson(json['transitTime'] as Map<String, dynamic>),
  numberOfStops: (json['numberOfStops'] as num?)?.toInt(),
);

Map<String, dynamic> _$FlightItemModalToJson(
  FlightItemModal instance,
) => <String, dynamic>{
  'segmentIdentifier': _$SegmentIdentifierEnumMap[instance.segmentIdentifier],
  'departure': instance.departure,
  'arrival': instance.arrival,
  'flightInfo': instance.flightInfo,
  'durationPerLeg': instance.durationPerLeg,
  'transitTime': instance.transitTime,
  'numberOfStops': instance.numberOfStops,
};

const _$SegmentIdentifierEnumMap = {
  SegmentIdentifier.SG_001001: 'SG_001001',
  SegmentIdentifier.SG_002001: 'SG_002001',
};

FlightInfoModal _$FlightInfoModalFromJson(Map<String, dynamic> json) =>
    FlightInfoModal(
      name: json['name'] as String?,
      code: $enumDecodeNullable(_$CodeEnumMap, json['code']),
      number: json['number'] as String?,
      cabinClass: $enumDecodeNullable(_$CabinClassEnumMap, json['cabinClass']),
      equipmentNumber: json['equipmentNumber'] as String?,
    );

Map<String, dynamic> _$FlightInfoModalToJson(FlightInfoModal instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': _$CodeEnumMap[instance.code],
      'number': instance.number,
      'cabinClass': _$CabinClassEnumMap[instance.cabinClass],
      'equipmentNumber': instance.equipmentNumber,
    };

const _$CodeEnumMap = {Code.EK: 'EK', Code.J9: 'J9', Code.KU: 'KU'};

const _$CabinClassEnumMap = {CabinClass.Y: 'Y'};

ArrivalModal _$ArrivalModalFromJson(Map<String, dynamic> json) => ArrivalModal(
  airportCode: $enumDecodeNullable(_$AirportCodeEnumMap, json['airportCode']),
  cityName: json['cityName'] as String?,
  dateTime: json['dateTime'] == null
      ? null
      : DateTime.parse(json['dateTime'] as String),
  terminal: json['terminal'] as String?,
);

Map<String, dynamic> _$ArrivalModalToJson(ArrivalModal instance) =>
    <String, dynamic>{
      'airportCode': _$AirportCodeEnumMap[instance.airportCode],
      'cityName': instance.cityName,
      'dateTime': instance.dateTime?.toIso8601String(),
      'terminal': instance.terminal,
    };

const _$AirportCodeEnumMap = {AirportCode.DXB: 'DXB', AirportCode.KWI: 'KWI'};

FareDetailsModal _$FareDetailsModalFromJson(Map<String, dynamic> json) =>
    FareDetailsModal(
      currency: json['currency'] as String?,
      baseFare: json['baseFare'] as String?,
      tax: json['tax'] as String?,
      decimalPoint: (json['decimalPoint'] as num?)?.toInt(),
      total: json['total'] as String?,
    );

Map<String, dynamic> _$FareDetailsModalToJson(FareDetailsModal instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'baseFare': instance.baseFare,
      'tax': instance.tax,
      'decimalPoint': instance.decimalPoint,
      'total': instance.total,
    };
