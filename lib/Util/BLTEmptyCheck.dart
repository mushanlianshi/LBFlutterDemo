
class BLTEmptyCheck{

  ///检查可选类型String List Map是不是空的
  static bool isEmpty<T>(T? value){
    if (value == null){
      return true;
    }
    if (value is String){
      return value.isEmpty;
    }else if(value is List){
      return value.isEmpty;
    }else if(value is Map){
      return value.isEmpty;
    }
    return false;
  }

  static bool isNotEmpty<T>(T? value){
    return !isEmpty(value);
  }
}