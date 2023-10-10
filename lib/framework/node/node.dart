

class GNodeContext {}

/// 节点对象
abstract class GNode {
  GNode({
    GNodeContext? context,
    List<GNode>? child,
  })  : _context = context,
        _child = child ?? [];

  List<GNode> _child;
  GNodeContext? _context;

  List<GNode> buildComponents();

  /// 节点挂载时的生命周期函数
  onMounted() {}

  /// 节点卸载时的生命周期函数
  onUnMounted() {}

  /// 节点就绪时的生命周期函数
  onReady() {
    _child = buildComponents();
    _context ??
        _child.forEach((element) {
          element._context = _context;
        });
  }
}

boot() {
  final root = RootNode(context: GNodeContext());
  root.onReady();
}

class RootNode extends GNode {
  RootNode({super.context});

  var afff = (String name) => 'hello';

  @override
  List<GNode> buildComponents() {
    return [RoleNode()];
  }
}

class RoleNode extends GNode {
  RoleNode({super.context});

  @override
  List<GNode> buildComponents() {
    return [];
  }
}

typedef Single = dynamic Function(String);

var a = Test<Single>((name)=>name);

class Test<T> {
  T f;
  Test(this.f) {
    //调用f
  }
}
