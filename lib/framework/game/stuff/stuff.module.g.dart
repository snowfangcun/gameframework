// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stuff.module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestStuff _$TestStuffFromJson(Map<String, dynamic> json) => TestStuff(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      desc: json['desc'] as String,
      stackNumMax: json['stackNumMax'] as int,
      isBind: json['isBind'] as bool,
      testName: json['testName'] as String,
    );

Map<String, dynamic> _$TestStuffToJson(TestStuff instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'desc': instance.desc,
      'stackNumMax': instance.stackNumMax,
      'isBind': instance.isBind,
      'testName': instance.testName,
    };
