/// 物品元数据类，所有物品都需要派生此类
/// 子类头部需要加上`@JsonSerializable()`注解
/// 子类所在文件头部加上`part 'xxx.g.dart'`
/// 子类中实现：
/// ```dart
/// Map<String, dynamic> toJson() => _$XXXToJson(this);
/// @override
/// fromJson(Map<String, dynamic> json) => _$XXXFromJson(json);
/// ```
/// 执行`flutter pub run build_runner build --delete-conflicting-outputs`生成json序列化代码
abstract class StuffMeta {
  /// 物品id，全局保持唯一，不可以重复
  String id;

  /// 物品名称
  String name;

  /// 物品类型
  String type;

  /// 物品描述
  String desc;

  /// 可堆叠最大数量
  int stackNumMax;

  /// 是否绑定
  bool isBind;

  StuffMeta({
    required this.id,
    required this.name,
    required this.type,
    required this.desc,
    required this.stackNumMax,
    required this.isBind,
  });

  fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
