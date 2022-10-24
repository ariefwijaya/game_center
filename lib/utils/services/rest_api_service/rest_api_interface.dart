import 'dart:io';

import 'package:dio/dio.dart';

abstract class RestApiInterface {
  /// Handle HTTP GET Request with custom headers
  ///
  /// [pathUrl] => BaseUrl + Endpoints.
  /// [headers] => Custom Headers (Optional).
  /// [body]  => Custom Params(Optional).
  Future<Response> get(
    String pathUrl, {
    Map<String, String?>? headers,
    Map<String, dynamic>? body,
    String? overrideBaseUrl,
    int? sendTimeout,
    int? receiveTimeout,
  });

  /// Handle HTTP POST Request with custom headers
  ///
  /// [pathUrl] => BaseUrl + Endpoints.
  /// [headers] => Custom Headers (Optional).
  /// [body]  => Custom Body IN (Optional).
  Future<Response> post(String pathUrl,
      {Map<String, String?>? headers,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      String? overrideBaseUrl});

  /// Handle HTTP PUT Request with custom headers
  ///
  /// [pathUrl] => BaseUrl + Endpoints.
  /// [headers] => Custom Headers (Optional).
  /// [body]  => Custom Body (Optional).
  Future<Response> put(String pathUrl,
      {Map<String, String?>? headers,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      String? overrideBaseUrl});

  /// Handle HTTP PUT Request with custom headers
  ///
  /// [pathUrl] => BaseUrl + Endpoints.
  /// [headers] => Custom Headers (Optional).
  /// [body]  => Custom Body (Optional).
  Future<Response> patch(String pathUrl,
      {Map<String, String?>? headers,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      String? overrideBaseUrl});

  /// Handle HTTP DELETE Request with custom headers
  ///
  /// [pathUrl] => BaseUrl + Endpoints.
  /// [headers] => Custom Headers (Optional).
  /// [body]  => Custom Body (Optional).
  Future<Response> delete(String pathUrl,
      {Map<String, String?>? headers,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      String? overrideBaseUrl});

  /// Add posibility to Upload files to Server using Rest API
  ///
  /// Example:
  ///```
  ///     FormData.fromMap({
  ///     "name": "wendux",
  ///     "age": 25,
  ///     "file": await MultipartFile.fromFile("./text.txt",filename: "upload.txt"),
  ///     "files": [
  ///       await MultipartFile.fromFile("./text1.txt", filename: "text1.txt"),
  ///       await MultipartFile.fromFile("./text2.txt", filename: "text2.txt"),
  ///     ]
  ///     });
  /// ```
  Future<Response> uploadFiles(String pathUrl,
      {Map<String, String?>? headers,
      FormData? body,
      Function(int, int)? onSendProgress,
      String? overrideBaseUrl});

  /// Return full url of uploaded file, used for third party uploader
  Future<Map<String, dynamic>> uploadFile(String pathUrl,
      {Map<String, String?>? headers,
      Map<String, dynamic>? body,
      String? fileFieldName,
      required File file,
      Function(int progress, int length)? onSendProgress,
      String? overrideBaseUrl});
}
