import 'package:lb_flutter_project/generated/json/base/json_field.dart';
import 'package:lb_flutter_project/generated/json/lb_original_convert_enum_entity.g.dart';
import 'dart:convert';
export 'package:lb_flutter_project/generated/json/lb_original_convert_enum_entity.g.dart';

enum LBSexType3{
	female(0),
	male(1);

	final int value;
	const LBSexType3(this.value);

	// 通过 int 值返回对应的枚举
	static LBSexType3 fromValue(int value) {
		return LBSexType3.values.firstWhere((e) => e.value == value);
	}
}

enum LBStringTypeEnum3{
	ten("10"),
	eleven("11"),
	televel("12");

	final String value;
	const LBStringTypeEnum3(this.value);

	// 通过 int 值返回对应的枚举
	static LBStringTypeEnum3 fromValue(String value) {
		return LBStringTypeEnum3.values.firstWhere((e) => e.value == value);
	}
}

enum LBPayType3{
	fullReduce(1),
	discount(2),
	reduce(3);

	final int value;
	const LBPayType3(this.value);

	// 通过 int 值返回对应的枚举
	static LBPayType3 fromValue(int value) {
		return LBPayType3.values.firstWhere((e) => e.value == value);
	}
}

enum LBColorType3 {
	yellow('yellow'),
	red('red'),
	blue('blue');

	// 枚举的 String 值
	final String value;

	// 构造函数
	const LBColorType3(this.value);

	// 通过 int 值返回对应的枚举
	static LBColorType3 fromValue(String value) {
		return LBColorType3.values.firstWhere((e) => e.value == value);
	}

}


@JsonSerializable()
class LbOriginalConvertEnumEntity {
	String name = '';

	@JSONField(isEnum: true)
	LBSexType3 sexType = LBSexType3.female;
	@JSONField(isEnum: true)
	LBColorType3 colorType = LBColorType3.red;
	@JSONField(isEnum: true)
	LBPayType3 payType = LBPayType3.discount;
	@JSONField(isEnum: true)
	LBStringTypeEnum3 stringType = LBStringTypeEnum3.eleven;

	LbOriginalConvertEnumEntity();

	factory LbOriginalConvertEnumEntity.fromJson(Map<String, dynamic> json) => $LbOriginalConvertEnumEntityFromJson(json);

	Map<String, dynamic> toJson() => $LbOriginalConvertEnumEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}