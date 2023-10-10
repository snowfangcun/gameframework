import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Center(
        child: Navigator(
      key: Get.nestedKey(1),
      initialRoute: "/r1",
      onGenerateRoute: (settings) => controller.onGenerateRoute(settings),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      id: "main",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("main")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
