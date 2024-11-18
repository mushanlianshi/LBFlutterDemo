import 'package:lb_flutter_project/generated/json/base/json_convert_content.dart';
import 'package:lb_flutter_project/module/bean/lb_test_entity.dart';

LbTestEntity $LbTestEntityFromJson(Map<String, dynamic> json) {
  final LbTestEntity lbTestEntity = LbTestEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    lbTestEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    lbTestEntity.msg = msg;
  }
  final String? areaName = jsonConvert.convert<String>(json['area_name']);
  if (areaName != null) {
    lbTestEntity.areaName = areaName;
  }
  final LbTestResult? result = jsonConvert.convert<LbTestResult>(
      json['result']);
  if (result != null) {
    lbTestEntity.result = result;
  }
  return lbTestEntity;
}

Map<String, dynamic> $LbTestEntityToJson(LbTestEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['area_name'] = entity.areaName;
  data['result'] = entity.result.toJson();
  return data;
}

extension LbTestEntityExtension on LbTestEntity {
  LbTestEntity copyWith({
    int? code,
    String? msg,
    String? areaName,
    LbTestResult? result,
  }) {
    return LbTestEntity()
      ..code = code ?? this.code
      ..msg = msg ?? this.msg
      ..areaName = areaName ?? this.areaName
      ..result = result ?? this.result;
  }
}

LbTestResult $LbTestResultFromJson(Map<String, dynamic> json) {
  final LbTestResult lbTestResult = LbTestResult();
  return lbTestResult;
}

Map<String, dynamic> $LbTestResultToJson(LbTestResult entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  return data;
}

extension LbTestResultExtension on LbTestResult {
}