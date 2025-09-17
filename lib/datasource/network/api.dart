import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as https;
import 'package:http/io_client.dart';
import 'package:task_app/core/custom_exception.dart';
import 'package:task_app/core/log_helper.dart';
import 'package:task_app/datasource/network/api_response_type.dart';

class Api {
  static const _apiLogStart = '<<<<<<<   ';
  static const _apiLogEnd = '   >>>>>>>';
  static const _apiLogUrl = 'URL -> ';
  static const _apiLogHeaders = 'HEADERS -> ';
  static const _apiLogRequest = 'REQUEST -> ';
  static const _apiLogResponse = 'RESPONSE -> ';

  IOClient get http {
    final ioc = HttpClient();
    ioc.badCertificateCallback = (final X509Certificate cert, final String host, final int port) => true;
    return IOClient(ioc);
  }

  Future<dynamic> get(final String url, final dynamic requestModel, final ApiResponseType apiResponseType,
      [final String? token,]) async {
    dynamic responseJson;

    logBlueText(_apiLogStart + _apiLogUrl + url + _apiLogEnd);
    Uri uri = Uri.parse(url);
    if (requestModel != null) {
      uri = uri.replace(queryParameters: json.decode(json.encode(requestModel)));
    }

    final headers = token == null
        ? {
            'Content-Type': 'application/json',
          }
        : {
            'Content-Type': 'application/json',
            'authorization': 'Bearer $token',
            // 'cookie': 'globeporter=$token',
          };

    final response = await http.get(uri, headers: headers);
    //logGreenText(_apiLogStart + _apiLogResponse + response.body + _apiLogEnd);
    responseJson = _response(response, apiResponseType);
    return responseJson;
  }

  Future<dynamic> post(final String url, final dynamic requestModel, final ApiResponseType apiResponseType,
      [final String? token,]) async {
    dynamic responseJson;

    logBlueText(_apiLogStart + _apiLogUrl + url + _apiLogEnd);
    final uri = Uri.parse(url);
    final headers = token == null
        ? {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          }
        : {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'authorization': 'Bearer $token',
            // 'cookie': 'globeporter=$token',
          };

    logYellowText(_apiLogStart + _apiLogHeaders + headers.toString() + _apiLogEnd);
    final requestBody = json.encode(requestModel);
    logYellowText(_apiLogStart + _apiLogRequest + requestBody + _apiLogEnd);
    final response = await http.post(uri, headers: headers, body: requestBody);
    /* logGreenText(_apiLogStart +
        _apiLogResponse +
        utf8.decode(response.bodyBytes) +
        _apiLogEnd);*/
    responseJson = _response(response, apiResponseType);
    return responseJson;
  }

  Future<dynamic> postWithoutCookie(
      final String url, final dynamic requestModel, final ApiResponseType apiResponseType,
      [final String? token,]) async {
    dynamic responseJson;

    logBlueText(_apiLogStart + _apiLogUrl + url + _apiLogEnd);
    final uri = Uri.parse(url);
    final headers = token == null
        ? {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          }
        : {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'authorization': 'Bearer $token',
            // 'cookie': 'globeporter=$token',
          };

    logYellowText(_apiLogStart + _apiLogHeaders + headers.toString() + _apiLogEnd);
    final requestBody = json.encode(requestModel);
    logYellowText(_apiLogStart + _apiLogRequest + requestBody + _apiLogEnd);
    final response = await http.post(uri, headers: headers, body: requestBody);
    /* logGreenText(_apiLogStart +
        _apiLogResponse +
        utf8.decode(response.bodyBytes) +
        _apiLogEnd);*/
    responseJson = _response(response, apiResponseType);
    return responseJson;
  }

  Future<dynamic> delete(final String url, final dynamic requestModel, final ApiResponseType apiResponseType,
      [final String? token,]) async {
    dynamic responseJson;

    logBlueText(_apiLogStart + _apiLogUrl + url + _apiLogEnd);
    final uri = Uri.parse(url);
    final headers = token == null
        ? {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          }
        : {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'authorization': 'Bearer $token',
            // 'cookie': 'globeporter=$token',
          };

    logYellowText(_apiLogStart + _apiLogHeaders + headers.toString() + _apiLogEnd);
    final requestBody = json.encode(requestModel);
    logYellowText(_apiLogStart + _apiLogRequest + requestBody + _apiLogEnd);
    final response = await http.delete(uri, headers: headers, body: requestBody);
    /* logGreenText(_apiLogStart +
        _apiLogResponse +
        utf8.decode(response.bodyBytes) +
        _apiLogEnd);*/
    responseJson = _response(response, apiResponseType);
    return responseJson;
  }

  Future<dynamic> patch(final String url, final dynamic requestModel, final ApiResponseType apiResponseType,
      [final String? token,]) async {
    dynamic responseJson;

    logBlueText(_apiLogStart + _apiLogUrl + url + _apiLogEnd);
    final uri = Uri.parse(url);
    final headers = token == null
        ? {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Accept': 'application/json',
          }
        : {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Accept': '*/*',
            'authorization': 'Bearer $token',
            //'cookie': 'globeporter=$token',
          };

    logYellowText(_apiLogStart + _apiLogHeaders + headers.toString() + _apiLogEnd);
    final requestBody = (requestModel as Map<String, dynamic>).entries
        .map((final e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
    logYellowText(_apiLogStart + _apiLogRequest + requestBody + _apiLogEnd);
    final response = await http.patch(uri, headers: headers, body: requestBody);
    /* logGreenText(_apiLogStart +
        _apiLogResponse +
        utf8.decode(response.bodyBytes) +
        _apiLogEnd);*/
    responseJson = _response(response, apiResponseType);
    return responseJson;
  }

  Future<dynamic> postWithFiles(final String url, final dynamic requestModel, final ApiResponseType apiResponseType,
      final Map<String, File?>? filesWithFieldNames,
      [final String? token,]) async {
    dynamic responseJson;

    logBlueText(_apiLogStart + _apiLogUrl + url + _apiLogEnd);
    final uri = Uri.parse(url);

    // Set headers
    final headers = token == null
        ? {
            'Accept': 'application/json',
          }
        : {
            'Accept': '*/*',
            'authorization': 'Bearer $token',
          };

    logYellowText(_apiLogStart + _apiLogHeaders + headers.toString() + _apiLogEnd);

    // Create a multipart request
    final request = https.MultipartRequest('POST', uri);
    request.headers.addAll(headers);

    // Add form fields
    (requestModel as Map<String, dynamic>).forEach((final key, final value) {
      request.fields[key] = value.toString();
    });

    // Log fields
    final String fieldLog = request.fields.toString();

// Log files
    final String fileLog = filesWithFieldNames!.entries.map((final entry) {
      final fieldName = entry.key;
      final file = entry.value;
      return '{field: $fieldName, path: ${file?.path}}';
    }).join(', ');

    logYellowText(
        '$_apiLogStart${_apiLogRequest}Fields: $fieldLog\nFiles: [$fileLog]$_apiLogEnd',);

    // Add all files with dynamic field names
    for (final entry in filesWithFieldNames.entries) {
      final fieldName = entry.key;
      final file = entry.value;

      if (file != null) {
        final multipartFile = await https.MultipartFile.fromPath(
          fieldName,
          file.path,
        );
        request.files.add(multipartFile);
      }
    }

    // Send the request and handle the response
    final streamedResponse = await request.send();
    final response = await https.Response.fromStream(streamedResponse);

    if (response.statusCode == 201 || response.statusCode == 200) {
      logGreenText(_apiLogStart + _apiLogResponse + utf8.decode(response.bodyBytes) + _apiLogEnd);
    } else {
      logRedText('Failed to upload file(s): ${response.statusCode}');
    }

    responseJson = _response(response, apiResponseType);
    return responseJson;
  }

  Future<dynamic> put(final String url, final dynamic requestModel, final ApiResponseType apiResponseType,
      [final String? token,]) async {
    dynamic responseJson;

    logBlueText(_apiLogStart + _apiLogUrl + url + _apiLogEnd);
    final uri = Uri.parse(url);
    final headers = token == null
        ? {
            'Content-Type': 'application/json',
          }
        : {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'};
    logYellowText(_apiLogStart + _apiLogHeaders + headers.toString() + _apiLogEnd);
    final requestBody = json.encode(requestModel);
    logYellowText(_apiLogStart + _apiLogRequest + requestBody + _apiLogEnd);
    final response = await http.put(uri, headers: headers, body: requestBody);
    logGreenText(_apiLogStart + _apiLogResponse + utf8.decode(response.bodyBytes) + _apiLogEnd);
    responseJson = _response(response, apiResponseType);
    return responseJson;
  }

  dynamic _response(final https.Response response, final ApiResponseType apiResponseType) {
    switch (response.statusCode) {
      case 200:
        final body = utf8.decode(response.bodyBytes);
        if (apiResponseType == ApiResponseType.json) {
          final dynamic responseJson = json.decode(body);
          return responseJson;
        } else {
          return body;
        }
      case 201:
        final body = utf8.decode(response.bodyBytes);
        if (apiResponseType == ApiResponseType.json) {
          final dynamic responseJson = json.decode(body);
          return responseJson;
        } else {
          return body;
        }
      case 400:
        _checkApiErrors(response, apiResponseType);
        break;
      case 401:
      case 403:
        _checkApiErrors(response, apiResponseType);
        break;
      case 500:
        // throw InternalServerException(response.body.toString());
        logRedText(response.body);
        throw ApiErrorException('Something went wrong');
      default:
        throw FetchDataException('Communication Error : ${response.statusCode}');
    }
  }

  void _checkApiErrors(final https.Response response, final ApiResponseType apiResponseType) {
    final body = utf8.decode(response.bodyBytes);
    if (apiResponseType == ApiResponseType.json) {
      final dynamic responseJson = json.decode(body);
      throw ApiErrorException((responseJson as Map<String, dynamic>)['message']);
    }
  }
}

class ErrorResponseModel {
  ErrorResponseModel({
    required this.accountExists,
    required this.message,
  });

  ErrorResponseModel.fromJson(final Map<String, dynamic>? json) {
    accountExists = json?['accountExists'] as bool?;
    message = json?['message'] as String?;
  }

  bool? accountExists;
  String? message;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['accountExists'] = accountExists;
    data['message'] = message;
    return data;
  }
}
