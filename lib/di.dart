import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:math/data/hive/cache_hive.dart';
import 'package:math/data/hive/hive_base.dart';

//dependency injection
final di = GetIt.instance;

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupConfigs();
  await setupFactories();
}

Future<void> setupConfigs() async {
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ],
  );
}

Future<void> setupFactories() async {
  di.registerSingleton(HiveBase());
  await di.get<HiveBase>().init();
  di.registerFactory(() => CacheHive(di.get<HiveBase>().cacheBox));
}
