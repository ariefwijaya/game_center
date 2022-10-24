import 'dart:developer';

import 'package:alice/alice.dart';
import 'package:game_center/config/injectable/injectable_core.dart';
import 'package:game_center/core/app_setting.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:injectable/injectable.dart';

/// Class to define required instances and configurations
@module
abstract class RestApiClientModule {
  // You can register named preemptive types like follows
  @Named("BaseUrl")
  String get baseUrl => AppSetting.baseUrl;

  // url here will be injected
  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(
      baseUrl: url,
      followRedirects: false,
      // will not throw errors when status is not 200
      validateStatus: (status) => status! < 502 && status != 401,
      connectTimeout: AppSetting.apiConnectTimeout,
      receiveTimeout: AppSetting.apiReceiveTimeout));
}

class RestApiClient {
  Future<void> addRequiredInterceptor({Dio? dioInstance}) async {
    // Display logs when access Restful API if set to true
    final Dio dio = dioInstance ?? getIt.get<Dio>();
    try {
      dio.options = dio.options.copyWith(
          baseUrl: AppSetting.baseUrl,
          connectTimeout: AppSetting.apiConnectTimeout,
          receiveTimeout: AppSetting.apiReceiveTimeout);
    } catch (e, s) {
      //do nothing when failed
      // ignore: avoid_print
      print("$e, $s");
    }
    // final dir = await getApplicationDocumentsDirectory();
    dio.interceptors.addAll([
      cacheInterceptor(),
      if (AppSetting.showLog) getIt.get<Alice>().getDioInterceptor(),
      if (AppSetting.showLog) logInterceptor(),
    ]);
  }

  DioCacheInterceptor cacheInterceptor() {
    return DioCacheInterceptor(
        options: CacheOptions(
            priority: CachePriority.high,
            // policy: CachePolicy.request,
            store: MemCacheStore(), // Required.
            // Default. Checks cache freshness, requests otherwise and caches response.
            hitCacheOnErrorExcept: [401, 403],
            // Very optional. Overrides any HTTP directive to delete entry past this duration.
            maxStale: const Duration(days: 7)));
  }

  LogInterceptor logInterceptor() {
    return LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) {
          log(obj.toString());
        });
  }
}
