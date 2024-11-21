// import 'package:get/get.dart';
// import 'package:wanjianhaofang/Util/named_router.dart';
// import 'package:wanjianhaofang/Util/net/http.dart';
// import 'package:wanjianhaofang/Util/shared_preferences.dart';
// import 'package:wanjianhaofang/Util/userManager/user_manager.dart';
//
// class LoginUtils {
//   // 等待登录，返回 true 表示登录成功
//   static Future<bool> awaitLogin() async {
//     if (isLogin()) {
//       return true;
//     }
//
//     dynamic result = await Get.toNamed(NamedRouter.login);
//     return result == true;
//   }
//
//   // 在登录 or 登录后做某事
//   static Future<bool> doAfterLogin(Function callback) async {
//     if (await awaitLogin()) {
//       callback();
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   static bool isLogin() {
//     String? userId = prefs.getString(PrefsKey.userId);
//     if (userId != null && userId.isNotEmpty) {
//       return true;
//     }
//     return false;
//   }
//
//   // 注销登录
//   static logout() {
//     prefs.remove(PrefsKey.name);
//     prefs.remove(PrefsKey.mobile);
//     prefs.remove(PrefsKey.userId);
//     prefs.remove(PrefsKey.nickname);
//     prefs.remove(PrefsKey.ut);
//     prefs.remove(PrefsKey.isBlackList);
//     prefs.remove(PrefsKey.avatar);
//     prefs.remove(PrefsKey.IMToken);
//
//     Http().removeCommonParams("ut");
//     Http().removeCommonParams("user_id");
//     UserManager.getInstance().logout();
//     // if (Get.currentRoute != NamedRouter.login) {
//     //   Get.offAllNamed(NamedRouter.login);
//     // }
//   }
// }
