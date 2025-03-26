import 'package:lb_flutter_project/generated/json/base/json_field.dart';
import 'package:lb_flutter_project/generated/json/l_b_enum_convert_model_entity.g.dart';
import 'dart:convert';
// export 'package:lb_flutter_project/generated/json/l_b_enum_convert_model_entity.g.dart';


enum LBSexType{
		female(0),
		male(1);

	final int value;
	const LBSexType(this.value);

	// 通过 int 值返回对应的枚举
	static LBSexType fromValue(int value) {
		return LBSexType.values.firstWhere((e) => e.value == value, orElse: () => LBSexType.female);
	}
}

enum LBStringTypeEnum{
	ten("10"),
	eleven("11"),
	televel("12");

	final String value;
	const LBStringTypeEnum(this.value);

	// 通过 int 值返回对应的枚举
	static LBStringTypeEnum fromValue(String value) {
		// 处理值不在枚举中的 orElse: () => LBStringTypeEnum.ten 用orElse来返回
		return LBStringTypeEnum.values.firstWhere((e) => e.value == value, orElse: () => LBStringTypeEnum.ten);
	}
}


// 覆盖系统分类里的方法，来实现枚举的转换， 因为.g.dart文件中导入的是这个头文件，会走这个头文件里的方法。
extension EnumByName22<T extends Enum> on Iterable<T> {
	T byName(String name) {
		final String type = T.toString();
		// print("LBLog byName is ${name} ${type}");
		if(type == "LBSexType"){
			// print("LBLog T is LBSexType");
			var value = LBSexType.fromValue(int.parse(name));
			return value as T;
		}else if(type == "LBPayType"){
			var value = LBPayType.fromValue(int.parse(name));
			return value as T;
		}else if(type == "LBStringTypeEnum"){
			var value = LBStringTypeEnum.fromValue(name);
			return value as T;
		}else if (type == "LBColorType"){
			var value = LBColorType.fromValue(name);
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

enum LBPayType{
		fullReduce(1),
		discount(2),
		reduce(3);

		final int value;
		const LBPayType(this.value);

		// 通过 int 值返回对应的枚举
		static LBPayType fromValue(int value) {
			return LBPayType.values.firstWhere((e) => e.value == value);
		}
}

enum LBColorType {
	yellow('yellow'),
	red('red'),
	blue('blue');

	// 枚举的 String 值
	final String value;

	// 构造函数
	const LBColorType(this.value);

	// 通过 int 值返回对应的枚举
	static LBColorType fromValue(String value) {
		return LBColorType.values.firstWhere((e) => e.value == value);
	}

	toJson() {
		return value;
	}

	// 可选: 获取枚举的名称
	@override
	String toString() {
		return '$name ($value)';
	}
}

@JsonSerializable()
class LBEnumConvertModelEntity {

	@JSONField(isEnum: true)
	LBPayType payType = LBPayType.discount;

	@JSONField(isEnum: true)
	LBColorType colorType = LBColorType.red;
	String name = '';

	@JSONField(isEnum: true)
	late LBSexType sexType = LBSexType.male;

	@JSONField(isEnum: true)
	late LBStringTypeEnum stringType = LBStringTypeEnum.ten;

	LBEnumConvertModelEntity();

	factory LBEnumConvertModelEntity.fromJson(Map<String, dynamic> json) => $LBEnumConvertModelEntityFromJson(json);

	Map<String, dynamic> toJson() => $LBEnumConvertModelEntityToJson(this);


	@override
	String toString() {
		return jsonEncode(this);
	}
}

