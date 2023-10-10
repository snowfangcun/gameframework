import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// mvvm结构viewmodel层
abstract class BaseViewModel extends ChangeNotifier {
  BaseViewModel();

  onCreate() {}

  onBuild() {}

  onDispose() {}
}


/// mvvm结构的view层组件基类
/// [VM]是viewModel类型
abstract class BaseViewModelWidget<VM extends BaseViewModel>
    extends ConsumerStatefulWidget {
   const BaseViewModelWidget({
    super.key,
    required this.vm,
  });

  final VM vm;

  @override
  BaseViewModelState<BaseViewModelWidget, VM> createState();
}

/// 页面状态基类
/// [T]是组件类型
/// [VM]是viewModel类型
abstract class BaseViewModelState<T extends BaseViewModelWidget,
    VM extends BaseViewModel> extends ConsumerState<T> {
  @override
  void initState() {
    super.initState();
    widget.vm.onCreate();
  }

  @override
  Widget build(BuildContext context) {
    widget.vm.onBuild();
    return buildView(context);
  }

  @override
  void dispose() {
    super.dispose();
    widget.vm.onDispose();
  }

  Widget buildView(BuildContext context);

}
