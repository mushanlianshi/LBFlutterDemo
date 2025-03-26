import 'package:lb_flutter_project/generated/json/base/json_field.dart';
import 'package:lb_flutter_project/generated/json/l_b_convert_enum_entity2_entity.g.dart';
import 'dart:convert';
export 'package:lb_flutter_project/generated/json/l_b_convert_enum_entity2_entity.g.dart';


enum LBSexType2{
	female(0),
	male(1);

	final int value;
	const LBSexType2(this.value);

	// 通过 int 值返回对应的枚举
	static LBSexType2 fromValue(int value) {
		return LBSexType2.values.firstWhere((e) => e.value == value);
	}
}

enum LBStringTypeEnum2{
	ten("10"),
	eleven("11"),
	televel("12");

	final String value;
	const LBStringTypeEnum2(this.value);

	// 通过 int 值返回对应的枚举
	static LBStringTypeEnum2 fromValue(String value) {
		return LBStringTypeEnum2.values.firstWhere((e) => e.value == value);
	}
}

enum LBPayType2{
	fullReduce(1),
	discount(2),
	reduce(3);

	final int value;
	const LBPayType2(this.value);

	// 通过 int 值返回对应的枚举
	static LBPayType2 fromValue(int value) {
		return LBPayType2.values.firstWhere((e) => e.value == value);
	}
}

enum LBColorType2 {
	yellow('yellow'),
	red('red'),
	blue('blue');

	// 枚举的 String 值
	final String value;

	// 构造函数
	const LBColorType2(this.value);

	// 通过 int 值返回对应的枚举
	static LBColorType2 fromValue(String value) {
		return LBColorType2.values.firstWhere((e) => e.value == value);
	}

}

extension EnumByName22<T extends Enum> on Iterable<T> {
	T byName(String name) {
		final String type = T.toString();
		// print("LBLog byName2222 is ${name} ${type}");
		if(type == "LBSexType2"){
			// print("LBLog T is LBSexType2");
			var value = LBSexType2.fromValue(int.parse(name));
			return value as T;
		}else if(type == "LBPayType2"){
			var value = LBPayType2.fromValue(int.parse(name));
			return value as T;
		}else if(type == "LBStringTypeEnum2"){
			var value = LBStringTypeEnum2.fromValue(name);
			return value as T;
		}else if (type == "LBColorType2"){
			var value = LBColorType2.fromValue(name);
			return value as T;
		}
		for (var value in this) {
			if (value.toString().split('.').last == name) {
				return value;
			}
		}
		throw ArgumentError.value(name, "name", "No enum value with that name");
	}

}


@JsonSerializable()
class LBConvertEnumEntity2Entity {
	String name = '';

	@JSONField(isEnum: true)
	LBSexType2 sexType = LBSexType2.male;
	@JSONField(isEnum: true)
	LBColorType2 colorType = LBColorType2.red;
	@JSONField(isEnum: true)
	LBPayType2 payType = LBPayType2.fullReduce;
	@JSONField(isEnum: true)
	LBStringTypeEnum2 stringType = LBStringTypeEnum2.ten;

	LBConvertEnumEntity2Entity();

	factory LBConvertEnumEntity2Entity.fromJson(Map<String, dynamic> json) => $LBConvertEnumEntity2EntityFromJson(json);

	Map<String, dynamic> toJson() => $LBConvertEnumEntity2EntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}