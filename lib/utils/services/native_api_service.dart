import 'package:game_center/utils/utils.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Class that have static functions to access native platform or thirdparty
@module
abstract class NativeApiService {
  @injectable
  DeviceInfoPlugin get deviceInfoPlugin => DeviceInfoPlugin();

  @preResolve
  @lazySingleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @singleton
  CacheHelper get customCacheManager => CacheHelper();
}
