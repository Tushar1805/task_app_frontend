import 'dart:io';

import '../core/custom_exception.dart';
import '../core/utils/core_utils.dart';
import 'network/api.dart';
import 'network/api_call_type.dart';
import 'network/api_response_type.dart';


abstract class BaseRepository {
  final Api _api = Api();

  Future<dynamic> fetchData(
      {required final ApiCallType apiCallType,
      required final String apiUrl,
      final dynamic requestModel,
      final ApiResponseType? apiResponseType,
      final Map<String, File?>? filesWithFieldNames,
      final String? accessToken}) async {
    final internetConnected = await isInternetConnected();

    if (!internetConnected) {
      throw NoInternetException();
    }

    return _fetchApiData(
        apiCallType, apiUrl, requestModel, apiResponseType, filesWithFieldNames, accessToken);
  }

  Future<dynamic> _fetchApiData(
      final ApiCallType apiCallType,
      final String apiUrl,
      final dynamic requestModel,
      final ApiResponseType? apiResponseType,
      final Map<String, File?>? filesWithFieldNames,
      final String? accessToken) async {
    final apiResponse = apiCallType == ApiCallType.get
        ? await _api.get(
            apiUrl,
            requestModel,
            apiResponseType ?? ApiResponseType.json,
            accessToken,
          )
        : apiCallType == ApiCallType.put
            ? await _api.put(
                apiUrl,
                requestModel,
                apiResponseType ?? ApiResponseType.json,
                accessToken,
              )
            : apiCallType == ApiCallType.post
                ? await _api.post(
                    apiUrl,
                    requestModel,
                    apiResponseType ?? ApiResponseType.json,
                    accessToken,
                  )
                : apiCallType == ApiCallType.delete
                    ? await _api.delete(
                        apiUrl,
                        requestModel,
                        apiResponseType ?? ApiResponseType.json,
                        accessToken,
                      )
                    : apiCallType == ApiCallType.postNoCookie
                        ? await _api.postWithoutCookie(
                            apiUrl,
                            requestModel,
                            apiResponseType ?? ApiResponseType.json,
                            accessToken,
                          )
                        : apiCallType == ApiCallType.postWithFile
                            ? await _api.postWithFiles(
                                apiUrl,
                                requestModel,
                                apiResponseType ?? ApiResponseType.json,
                                filesWithFieldNames ?? {},
                                accessToken,
                              )
                            : await _api.patch(
                                apiUrl,
                                requestModel,
                                apiResponseType ?? ApiResponseType.json,
                                accessToken,
                              );
    return apiResponse;
  }
}
