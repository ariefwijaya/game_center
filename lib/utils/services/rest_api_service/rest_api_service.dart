import 'dart:io';

import 'package:game_center/env/env.dart';
import 'package:game_center/utils/services/rest_api_service/rest_api_interface.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Class that handle access and process to Restful API
@LazySingleton(as: RestApiInterface)
class RestApiService implements RestApiInterface {
  // Setup Dio configurations
  final Dio dio;

  const RestApiService({required this.dio});

  @override
  Future<Response> get(
    String pathUrl, {
    Map<String, String?>? headers,
    Map<String, dynamic>? body,
    String? overrideBaseUrl,
    int? sendTimeout,
    int? receiveTimeout,
  }) async {
    try {
      String _pathUrl =
          overrideBaseUrl != null ? (overrideBaseUrl + pathUrl) : pathUrl;
      final response = await dio.get(_pathUrl,
          queryParameters: (body ?? {})..addAll({"key": Env.apiKey}),
          options: Options(
              headers: headers,
              sendTimeout: sendTimeout,
              receiveTimeout: receiveTimeout));
      return _handleResponse(response);
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Response> post(String pathUrl,
      {Map<String, String?>? headers,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      String? overrideBaseUrl}) async {
    try {
      String _pathUrl =
          overrideBaseUrl != null ? (overrideBaseUrl + pathUrl) : pathUrl;
      final response = await dio.post(_pathUrl,
          data: body,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return _handleResponse(response);
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Response> delete(String pathUrl,
      {Map<String, String?>? headers,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      String? overrideBaseUrl}) async {
    try {
      String _pathUrl =
          overrideBaseUrl != null ? (overrideBaseUrl + pathUrl) : pathUrl;
      final response = await dio.delete(_pathUrl,
          data: body,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return _handleResponse(response);
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Response> put(String pathUrl,
      {Map<String, String?>? headers,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      String? overrideBaseUrl}) async {
    try {
      String _pathUrl =
          overrideBaseUrl != null ? (overrideBaseUrl + pathUrl) : pathUrl;
      final response = await dio.put(_pathUrl,
          data: body,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return _handleResponse(response);
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Response> patch(String pathUrl,
      {Map<String, String?>? headers,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      String? overrideBaseUrl}) async {
    try {
      String _pathUrl =
          overrideBaseUrl != null ? (overrideBaseUrl + pathUrl) : pathUrl;
      final response = await dio.patch(_pathUrl,
          data: body,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return _handleResponse(response);
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Response> uploadFiles(String pathUrl,
      {Map<String, String?>? headers,
      Map<String, dynamic>? queryParameters,
      FormData? body,
      Function(int, int)? onSendProgress,
      String? overrideBaseUrl}) async {
    String _pathUrl =
        overrideBaseUrl != null ? (overrideBaseUrl + pathUrl) : pathUrl;

    return dio
        .post(_pathUrl,
            data: body,
            queryParameters: queryParameters,
            onSendProgress: onSendProgress,
            options: Options(headers: headers))
        .then((Response response) {
      return _handleResponse(response);
    }).catchError((onError) => throw _handleError(onError as DioError));
  }

  /// Proces request to get statusCode from Rest API Response
  /// or else throw Error
  ///
  /// notes
  /// ada 1 lagi -2 sebenarnya jadi selain 0 dan 1 ada ini:
  /// -1 : invalid token  (kalau misalnya sudah expired) actionnya : relogin
  /// -2 : unmatched platform version (ini di pakai untuk force update)
  Response _handleResponse(Response response) {
    //we can manage how to receive the responses
    return response;
  }

  /// Process output from Expected Expetion in Catch(e,s)
  DioError _handleError(DioError e) {
    //we can manage how to handle errors
    return e;
  }

  @override
  Future<Map<String, dynamic>> uploadFile(String pathUrl,
      {Map<String, String?>? headers,
      Map<String, dynamic>? body,
      String? fileFieldName,
      required File file,
      Function(int progress, int length)? onSendProgress,
      String? overrideBaseUrl}) {
    // Can be use when we have requirement to upload file
    throw UnimplementedError();
  }
}
