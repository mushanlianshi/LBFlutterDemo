import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

class PrefsKey {
  static const String mobile = "mobile";
  static const String name = "name";
  static const String nickname = "nickname";
  static const String ut = "ut";
  static const String userId = "userId";
  static const String isBlackList = "isBlackList";
  static const String avatar = "avatar";
  static const String deviceId = "deviceId";
  static const String IMToken = "IMToken";
  static const String userProtocolAlert = "userProtocolAlert";
  static const String httpHost = "httpHost";
  static const String webHost = "webHost";

  // 更新下载新app断点续传时用的etag
  static const String newApkFileEtag = "newApkFileEtag";
  // 更新下载新app断点续传时用的LastModified
  static const String newApkFileLastModified = "newApkFileLastModified";
  static const String cdnHost = "cdnHost";
}
