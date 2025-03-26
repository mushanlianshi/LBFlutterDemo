import 'package:lb_flutter_project/generated/json/base/json_convert_content.dart';
import 'package:lb_flutter_project/module/EnumConvert/entity/l_b_enum_convert_model_entity.dart';

LBEnumConvertModelEntity $LBEnumConvertModelEntityFromJson(
    Map<String, dynamic> json) {
  final LBEnumConvertModelEntity lBEnumConvertModelEntity = LBEnumConvertModelEntity();
  final LBPayType? payType = jsonConvert.convert<LBPayType>(
      json['payType'], enumConvert: (v) => LBPayType.values.byName(v));
  if (payType != null) {
    lBEnumConvertModelEntity.payType = payType;
  }
  final LBColorType? colorType = jsonConvert.convert<LBColorType>(
      json['colorType'], enumConvert: (v) => LBColorType.values.byName(v));
  if (colorType != null) {
    lBEnumConvertModelEntity.colorType = colorType;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    lBEnumConvertModelEntity.name = name;
  }
  final LBSexType? sexType = jsonConvert.convert<LBSexType>(
      json['sexType'], enumConvert: (v) => LBSexType.values.byName(v));
  if (sexType != null) {
    lBEnumConvertModelEntity.sexType = sexType;
  }
  final LBStringTypeEnum? stringType = jsonConvert.convert<LBStringTypeEnum>(
      json['stringType'],
      enumConvert: (v) => LBStringTypeEnum.values.byName(v));
  if (stringType != null) {
    lBEnumConvertModelEntity.stringType = stringType;
  }
  return lBEnumConvertModelEntity;
}

Map<String, dynamic> $LBEnumConvertModelEntityToJson(
    LBEnumConvertModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['payType'] = entity.payType.name;
  data['colorType'] = entity.colorType.name;
  data['name'] = entity.name;
  data['sexType'] = entity.sexType.name;
  data['stringType'] = entity.stringType.name;
  return data;
}

extension LBEnumConvertModelEntityExtension on LBEnumConvertModelEntity {
  LBEnumConvertModelEntity copyWith({
    LBPayType? payType,
    LBColorType? colorType,
    String? name,
    LBSexType? sexType,
    LBStringTypeEnum? stringType,
  }) {
    return LBEnumConvertModelEntity()
      ..payType = payType ?? this.payType
      ..colorType = colorType ?? this.colorType
      ..name = name ?? this.name
      ..sexType = sexType ?? this.sexType
      ..stringType = stringType ?? this.stringType;
  }
}