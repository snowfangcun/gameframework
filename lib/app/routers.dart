import 'package:get/get.dart';
import 'package:gameframework/pages/main/index.dart';

/// 路由名称枚举
class RouterName {
  static const main = '/main';
  static const home = '/home';
  static const settings = '/settings';
}

class RoutePages {
  static List<GetPage> lsit = [
    GetPage(name: RouterName.main, page: () => const MainPage()),
  ];
}

