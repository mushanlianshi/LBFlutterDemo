import 'package:lb_flutter_project/generated/json/base/json_convert_content.dart';
import 'package:lb_flutter_project/module/EnumConvert/entity/lb_original_convert_enum_entity.dart';

LbOriginalConvertEnumEntity $LbOriginalConvertEnumEntityFromJson(
    Map<String, dynamic> json) {
  final LbOriginalConvertEnumEntity lbOriginalConvertEnumEntity = LbOriginalConvertEnumEntity();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    lbOriginalConvertEnumEntity.name = name;
  }
  final LBSexType3? sexType = jsonConvert.convert<LBSexType3>(
      json['sexType'], enumConvert: (v) => LBSexType3.values.byName(v));
  if (sexType != null) {
    lbOriginalConvertEnumEntity.sexType = sexType;
  }
  final LBColorType3? colorType = jsonConvert.convert<LBColorType3>(
      json['colorType'], enumConvert: (v) => LBColorType3.values.byName(v));
  if (colorType != null) {
    lbOriginalConvertEnumEntity.colorType = colorType;
  }
  final LBPayType3? payType = jsonConvert.convert<LBPayType3>(
      json['payType'], enumConvert: (v) => LBPayType3.values.byName(v));
  if (payType != null) {
    lbOriginalConvertEnumEntity.payType = payType;
  }
  final LBStringTypeEnum3? stringType = jsonConvert.convert<LBStringTypeEnum3>(
      json['stringType'],
      enumConvert: (v) => LBStringTypeEnum3.values.byName(v));
  if (stringType != null) {
    lbOriginalConvertEnumEntity.stringType = stringType;
  }
  return lbOriginalConvertEnumEntity;
}

Map<String, dynamic> $LbOriginalConvertEnumEntityToJson(
    LbOriginalConvertEnumEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['sexType'] = entity.sexType.name;
  data['colorType'] = entity.colorType.name;
  data['payType'] = entity.payType.name;
  data['stringType'] = entity.stringType.name;
  return data;
}

extension LbOriginalConvertEnumEntityExtension on LbOriginalConvertEnumEntity {
  LbOriginalConvertEnumEntity copyWith({
    String? name,
    LBSexType3? sexType,
    LBColorType3? colorType,
    LBPayType3? payType,
    LBStringTypeEnum3? stringType,
  }) {
    return LbOriginalConvertEnumEntity()
      ..name = name ?? this.name
      ..sexType = sexType ?? this.sexType
      ..colorType = colorType ?? this.colorType
      ..payType = payType ?? this.payType
      ..stringType = stringType ?? this.stringType;
  }
}