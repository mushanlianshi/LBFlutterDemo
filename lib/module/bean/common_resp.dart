import 'dart:convert';

import 'package:lb_flutter_project/generated/json/base/json_convert_content.dart';

class CommonResp<T> {
  late int code;
  late String msg;
  late T? result;

  CommonResp();

  CommonResp.fromJson(Map<String, dynamic> json) {
    code = int.parse(json["code"].toString());
    msg = json["msg"] as String? ?? "";
    if (json.containsKey("result")) {
      Object? jsonResult = json["result"] as Object?;
      if (jsonResult == null) {
        result = null;
        return;
      }

      result = _generateOBJ<T>(jsonResult);
      if (result == null && jsonResult.toString().trim() != "") {
        // json解析失败
        throw Exception();
      }
    }
  }

  T? _generateOBJ<O>(Object? json) {
    if (json == null) {
      return null;
    }
    if (T.toString() == 'String') {
      return json.toString() as T;
    } else if (T.toString() == 'Map<dynamic, dynamic>') {
      return json as T;
    } else {
      return JsonConvert.fromJsonAsT<T>(json);
    }
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
