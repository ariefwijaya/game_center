import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CacheHelper {
  CacheManager get instance => _i;
  static const key = 'customCacheKey';
  late CacheManager _i;
  CacheHelper() {
    _i = CacheManager(
      Config(
        key,
        stalePeriod: const Duration(days: 30),
        maxNrOfCacheObjects: 300,
        repo: JsonCacheInfoRepository(databaseName: key),
        // fileSystem: IOFileSystem(key),
        fileService: HttpFileService(),
      ),
    );
  }
}
