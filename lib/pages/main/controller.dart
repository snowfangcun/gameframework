import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gameframework/pages/home/index.dart';

class MainController extends GetxController {
  MainController();

  _initData() {
    update(["main"]);
  }

  GetPageRoute onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/r1') {
      return GetPageRoute(
          settings: settings,
          page: () => ElevatedButton(
              onPressed: () {
                Get.toNamed('/r2', id: 1);
              },
              child: const Text('跳转')),
          transition: Transition.topLevel);
    } else {
      return GetPageRoute(
          settings: settings,
          page: () => const HomePage(),
          transition: Transition.rightToLeft);
    }
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
