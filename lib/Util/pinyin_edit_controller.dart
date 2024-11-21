
import 'package:flutter/cupertino.dart';


///需要用addlistener方法配合
class PinYinEditController extends TextEditingController{
  ///拼音完成后的文字
  String completeText = "";
  @override
  TextSpan buildTextSpan({required BuildContext context, TextStyle? style, required bool withComposing}) {
    ///拼音输入完成
    if (!value.composing.isValid || !withComposing) {
      if(completeText!=value.text){
        completeText = value.text;
        WidgetsBinding.instance.addPostFrameCallback((_){
          notifyListeners();
        });
      }
    }
    return super.buildTextSpan(context: context, style: style, withComposing: withComposing);
  }
}