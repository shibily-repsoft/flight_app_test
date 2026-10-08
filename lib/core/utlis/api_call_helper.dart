import 'dart:async';
import 'dart:io';

import 'package:flight_app_test/core/entities/api_result_model.dart';
import 'package:flight_app_test/core/utlis/connectvity_helper.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

const String devBaseUrl =
    'http://103.214.233.90/mechine_test';

const String contentTypeKey = 'Content-Type';

const String contentTypeValue = 'application/json';

const Duration timeOutDuration = Duration(seconds: 30);

const String commonErrorUnexpectedMessage =
    'Something went wrong, please try again later.';

const String commonConnectionFailedMessage =
    'Unable to connect to the internet. Please check your connection and try again.';

const int timeoutRequestStatusCode = 408;

const int ioExceptionStatusCode = 503;

@injectable
class ApiCallHelper {
  ApiCallHelper(this.connectivityCheckerHelper);

  final ConnectivityCheckerHelper connectivityCheckerHelper;

  final String baseUrl = devBaseUrl;

  Map<String, String> _sharedDefaultHeader = <String, String>{};

  Future<void> initSharedDefaultHeader([
    String contentValue = contentTypeValue,
  ]) async {
    _sharedDefaultHeader = <String, String>{};

    _sharedDefaultHeader.addAll(<String, String>{
      contentTypeKey: contentValue,
    });
  }

  Future<bool> _getConnectionState() async {
    final bool _result =
        await connectivityCheckerHelper.checkConnectivity();

    return _result;
  }

  /// [params] will be added to the URL as query parameters.
  Future<ApiResultModel<http.Response>> getWS({
    required String uri,
    Map<String, String> headers = const <String, String>{},
    Map<String, dynamic> params = const <String, dynamic>{},
  }) async {
    await initSharedDefaultHeader();

    _sharedDefaultHeader.addAll(headers);

    if (await _getConnectionState()) {
      try {
        final String _url = '$baseUrl$uri';

        final http.Response response = await http
            .get(
              _url.parseUri(params: params),
              headers: _sharedDefaultHeader,
            )
            .timeout(timeOutDuration);

        if (response.statusCode >= 200 &&
            response.statusCode < 300) {
          return ApiResultModel<http.Response>.success(
            data: response,
          );
        } else {
          return ApiResultModel<http.Response>.failure(
            errorResultEntity: ErrorResultModel(
              message: response.reasonPhrase ??
                  commonErrorUnexpectedMessage,
              statusCode: response.statusCode,
            ),
          );
        }
      } on TimeoutException catch (_) {
        return const ApiResultModel<http.Response>.failure(
          errorResultEntity: ErrorResultModel(
            message: commonErrorUnexpectedMessage,
            statusCode: timeoutRequestStatusCode,
          ),
        );
      } on IOException catch (_) {
        throw CustomConnectionException(
          exceptionMessage: commonConnectionFailedMessage,
          exceptionCode: ioExceptionStatusCode,
        );
      }
    } else {
      throw CustomConnectionException(
        exceptionMessage: commonConnectionFailedMessage,
        exceptionCode: ioExceptionStatusCode,
      );
    }
  }
}

class CustomConnectionException implements Exception {
  CustomConnectionException({
    required this.exceptionMessage,
    required this.exceptionCode,
  });

  final String exceptionMessage;
  final int exceptionCode;

  @override
  String toString() {
    return 'CustomConnectionException: '
        '$exceptionMessage ($exceptionCode)';
  }
}

/// Converts a String URL into a Uri and appends query parameters.
extension UriParserExtension on String {
  Uri parseUri({
    Map<String, dynamic> params = const <String, dynamic>{},
  }) {
    final Uri uri = Uri.parse(this);

    if (params.isEmpty) {
      return uri;
    }

    return uri.replace(
      queryParameters: params.map(
        (String key, dynamic value) => MapEntry(
          key,
          value?.toString() ?? '',
        ),
      ),
    );
  }
}