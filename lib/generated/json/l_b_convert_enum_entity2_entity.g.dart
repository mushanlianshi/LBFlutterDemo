import 'package:lb_flutter_project/generated/json/base/json_convert_content.dart';
import 'package:lb_flutter_project/module/EnumConvert/entity/l_b_convert_enum_entity2_entity.dart';

LBConvertEnumEntity2Entity $LBConvertEnumEntity2EntityFromJson(
    Map<String, dynamic> json) {
  final LBConvertEnumEntity2Entity lBConvertEnumEntity2Entity = LBConvertEnumEntity2Entity();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    lBConvertEnumEntity2Entity.name = name;
  }
  final LBSexType2? sexType = jsonConvert.convert<LBSexType2>(
      json['sexType'], enumConvert: (v) => LBSexType2.values.byName(v));
  if (sexType != null) {
    lBConvertEnumEntity2Entity.sexType = sexType;
  }
  final LBColorType2? colorType = jsonConvert.convert<LBColorType2>(
      json['colorType'], enumConvert: (v) => LBColorType2.values.byName(v));
  if (colorType != null) {
    lBConvertEnumEntity2Entity.colorType = colorType;
  }
  final LBPayType2? payType = jsonConvert.convert<LBPayType2>(
      json['payType'], enumConvert: (v) => LBPayType2.values.byName(v));
  if (payType != null) {
    lBConvertEnumEntity2Entity.payType = payType;
  }
  final LBStringTypeEnum2? stringType = jsonConvert.convert<LBStringTypeEnum2>(
      json['stringType'],
      enumConvert: (v) => LBStringTypeEnum2.values.byName(v));
  if (stringType != null) {
    lBConvertEnumEntity2Entity.stringType = stringType;
  }
  return lBConvertEnumEntity2Entity;
}

Map<String, dynamic> $LBConvertEnumEntity2EntityToJson(
    LBConvertEnumEntity2Entity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['sexType'] = entity.sexType.name;
  data['colorType'] = entity.colorType.name;
  data['payType'] = entity.payType.name;
  data['stringType'] = entity.stringType.name;
  return data;
}

extension LBConvertEnumEntity2EntityExtension on LBConvertEnumEntity2Entity {
  LBConvertEnumEntity2Entity copyWith({
    String? name,
    LBSexType2? sexType,
    LBColorType2? colorType,
    LBPayType2? payType,
    LBStringTypeEnum2? stringType,
  }) {
    return LBConvertEnumEntity2Entity()
      ..name = name ?? this.name
      ..sexType = sexType ?? this.sexType
      ..colorType = colorType ?? this.colorType
      ..payType = payType ?? this.payType
      ..stringType = stringType ?? this.stringType;
  }
}