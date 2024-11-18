import 'package:lb_flutter_project/generated/json/base/json_field.dart';
import 'package:lb_flutter_project/generated/json/lb_test_entity.g.dart';
import 'dart:convert';
export 'package:lb_flutter_project/generated/json/lb_test_entity.g.dart';

@JsonSerializable()
class LbTestEntity {
	late int code = 0;
	late String msg = '';
	@JSONField(name: "area_name")
	late String areaName = '';
	late LbTestResult result;

	LbTestEntity();

	factory LbTestEntity.fromJson(Map<String, dynamic> json) => $LbTestEntityFromJson(json);

	Map<String, dynamic> toJson() => $LbTestEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class LbTestResult {


	LbTestResult();

	factory LbTestResult.fromJson(Map<String, dynamic> json) => $LbTestResultFromJson(json);

	Map<String, dynamic> toJson() => $LbTestResultToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}