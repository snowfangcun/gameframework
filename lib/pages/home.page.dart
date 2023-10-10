import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final testStateProvider = StateProvider<String>((ref) => '666');

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('我是标题'),
        ),
        body: Column(
          children: [
            Row(children: [
              ElevatedButton(
                  onPressed: () =>
                      {_navigatorKey.currentState!.pushNamed('/r1')},
                  child: const Text('子路由a')),
              
              ElevatedButton(
                  onPressed: () =>
                      {_navigatorKey.currentState!.pushNamed('/r2')},
                  child: const Text('子路由b')),
              ElevatedButton(
                  onPressed: () => {_navigatorKey.currentState?.pop()},
                  child: const Text('回退')),
            ]),
            Container(
              color: Colors.brown,
              height: 200,
              width: 200,
              child: Navigator(
                  key: _navigatorKey,
                  initialRoute: '/r1',
                  onGenerateRoute: onGenerateRoute),
            )
          ],
        ));
  }

  /// 路由生成方法
  Route onGenerateRoute(RouteSettings settings) {
    late Widget page;
    switch (settings.name) {
      case '/r1':
        page = const R1();
        break;
      case '/r2':
        page = const R2();
        break;
    }
    return MaterialPageRoute(builder: (context) => page, settings: settings);
  }
}

class R1 extends ConsumerWidget {
  const R1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var v = ref.watch(testStateProvider);
    return Column(
      children: [
        Text('路由a:$v'),
        ElevatedButton(
            onPressed: () =>
                {ref.read(testStateProvider.notifier).state = '变更值'},
            child: const Text('修改值'))
      ],
    );
  }
}

class R2 extends StatelessWidget {
  const R2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('路由b');
  }
}
