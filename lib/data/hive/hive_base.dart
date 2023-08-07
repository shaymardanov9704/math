import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveBase {
  late final Box _cacheBox;

  Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init("${directory.path}/math");
    _cacheBox = await Hive.openBox("cache");
  }

  Box get cacheBox => _cacheBox;
}
