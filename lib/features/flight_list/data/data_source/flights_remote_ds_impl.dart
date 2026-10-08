import 'dart:convert';

import 'package:flight_app_test/core/entities/api_result_model.dart';
import 'package:flight_app_test/core/utlis/api_call_helper.dart';
import 'package:flight_app_test/features/flight_list/data/modals/flight_modal.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import 'flights_remote_ds.dart';

@Injectable(as: FlightsRemoteDataSource)
class FlightsRemoteDataSourceImpl implements FlightsRemoteDataSource {
  FlightsRemoteDataSourceImpl(this._apiCallHelper);

  final ApiCallHelper _apiCallHelper;

  @override
  Future<ApiResultModel<FlightModal?>> getFlightsData(
      {String? cityName}) async {
    try {
      final ApiResultModel<Response> result = await _apiCallHelper.getWS(
        uri: "/results.json",
      );
      return await result.when(
        success: (Response response) {
          try {
            final dynamic decoded = jsonDecode(response.body);
            if (decoded is Map<String, dynamic>) {
              final normalized = _normalizeFlightJson(decoded);
              final flightModal = FlightModal.fromJson(normalized);
              return ApiResultModel<FlightModal?>.success(data: flightModal);
            }
            return const ApiResultModel<FlightModal?>.failure(
              errorResultEntity: ErrorResultModel(
                message: 'Invalid data format received from server',
              ),
            );
          } catch (e) {
            return ApiResultModel<FlightModal?>.failure(
              errorResultEntity: ErrorResultModel(
                message: 'Parsing error: $e',
              ),
            );
          }
        },
        failure: (ErrorResultModel errorModel) {
          return ApiResultModel<FlightModal?>.failure(
            errorResultEntity: errorModel,
          );
        },
      );
    } on CustomConnectionException catch (exception) {
      return ApiResultModel<FlightModal?>.failure(
        errorResultEntity: ErrorResultModel(
          message: exception.exceptionMessage,
          statusCode: exception.exceptionCode,
        ),
      );
    } catch (e) {
      return ApiResultModel<FlightModal?>.failure(
        errorResultEntity: ErrorResultModel(
          message: e.toString(),
        ),
      );
    }
  }

  Map<String, dynamic> _normalizeFlightJson(Map<String, dynamic> rawJson) {
    final dynamic dataObj = rawJson['Data'] ?? rawJson['data'] ?? rawJson;

    dynamic clean(dynamic item) {
      if (item is Map) {
        final Map<String, dynamic> res = {};
        item.forEach((key, value) {
          final strKey = key.toString().trim();
          final camelKey = strKey.isEmpty
              ? strKey
              : strKey[0].toLowerCase() + strKey.substring(1);

          if ((camelKey == 'cityName' || camelKey == 'name') && value is Map) {
            res[camelKey] = (value['en'] ?? value['ar'] ?? value.values.firstOrNull ?? '').toString();
          } else {
            res[camelKey] = clean(value);
          }
        });

        if (res.containsKey('resultCount')) {
          res['resultCount '] = res['resultCount'];
        }

        return res;
      } else if (item is List) {
        return item.map(clean).toList();
      } else if (item is String) {
        if (item == 'JN-001') return 'JN_001';
        if (item == 'JN-002') return 'JN_002';
        if (item == 'SG-001-001') return 'SG_001001';
        if (item == 'SG-002-001') return 'SG_002001';
        return item;
      }
      return item;
    }

    final cleaned = clean(dataObj);
    if (cleaned is Map<String, dynamic>) {
      return cleaned;
    }
    return Map<String, dynamic>.from(cleaned as Map);
  }
}
