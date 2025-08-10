import 'package:hive_flutter/hive_flutter.dart';
import 'package:session/data/models/cart_item.dart';
import 'package:session/data/models/cart_model.dart';

const String cacheCartKey = 'cacheCart';

class HiveSetup {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(cacheCartKey);
    Hive.registerAdapter(CartItemAdapter());
    Hive.registerAdapter(CartAdapter());
  }
}
