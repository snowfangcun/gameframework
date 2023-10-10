import 'package:json_annotation/json_annotation.dart';

import '../meta/data.meta.dart';
part 'stuff.module.g.dart';

final stuffsBuilder = StuffsBuilder();

class StuffsBuilder {
  final List<StuffMeta> _stuffs = [];

  fromJson(String json) {}

  fromObject(List<StuffMeta> objs) => objs.forEach((element) => _push(element));

  _push(StuffMeta stuff) {
    var result = _stuffs.any((element) => element.id == stuff.id);
    if (result) {
      throw Exception('物品集合中已经存在id为${stuff.id}的物品');
    }
    _stuffs.add(stuff);
  }

  T? getById<T extends StuffMeta>(String id) {
    var stuff = _stuffs.where((element) => element.id == id).firstOrNull;
    return (stuff != null && stuff is T) ? stuff : null;
  }
}

test() {
  stuffsBuilder.fromObject([
    TestStuff(
        id: 'id',
        name: '测试名',
        type: '武器',
        desc: 'desc',
        stackNumMax: 1,
        isBind: false,
        testName: "testName")
  ]);
}

@JsonSerializable()
class TestStuff extends StuffMeta {
  String testName;

  TestStuff(
      {required super.id,
      required super.name,
      required super.type,
      required super.desc,
      required super.stackNumMax,
      required super.isBind,
      required this.testName});

  factory TestStuff.fromJson(Map<String, dynamic> json) =>
      _$TestStuffFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TestStuffToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => _$TestStuffFromJson(json);
}
