
import 'package:lb_flutter_project/generated/json/base/json_convert_content.dart';

T? valueFromArguments<T>(dynamic arguments, String key){
    if (arguments == null || (arguments is Map<String, dynamic>) == false){
      return null;
    }
    Map<String, dynamic> map = arguments;
    return jsonConvert.convert<T>(map[key]);
}
