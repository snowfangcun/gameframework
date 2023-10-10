import 'package:flutter/material.dart';
import 'package:project1/framework/node/node.dart';
import 'package:project1/framework/view/page.widget.dart';
import 'package:project1/store/app.stroe.dart';
import 'home.page.dart';

void aaa(){

}


class MainPageViewModel extends BaseViewModel {

  @override
  onCreate() {
    super.onCreate();
    print('组件初始化');
  }

  @override
  onBuild() {
    print('组件渲染');
  }
}

class MainPage extends BaseViewModelWidget<MainPageViewModel> {
  MainPage({super.key}) : super(vm: MainPageViewModel());
  @override
  MainPageState createState() => MainPageState();

}


class MainPageState extends BaseViewModelState<MainPage, MainPageViewModel> {
  @override
  Widget buildView(BuildContext context) {

    final appstate = ref.watch(appState);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('仙路遥${appstate.count}'),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage('images/logo.png'),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              const Text(
                  '仙路遥，仙路遥，童子苦盼老翁瞧，今日大娃刚走路，明日二娃腰已酥，白发复劝孩童小，莫入仙途候骨枯。\n仙路遥，仙路遥，少壮立志踏仙路，他日人鬼已殊途，三丈坟头青青草，后辈童子戏嚣挠。'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: const Text('创建角色')),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: const Text('开始游戏')),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    ref.read(appState.notifier).addCount(1);
                  },
                  child: const Text('关于游戏')),
            ],
          ),
        ));
  }
}