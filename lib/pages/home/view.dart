import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Column(
      children: [
        Obx(() => Text('计数1：${controller.num.value}')),
        Text('计数2：${controller.num.value}'),
        ElevatedButton(
          onPressed: () {
            controller.num.value += 1;
          },
          child: const Text("HomePage"),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      id: "home",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("home")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }

}
