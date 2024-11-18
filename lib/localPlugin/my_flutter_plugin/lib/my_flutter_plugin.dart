
import 'my_flutter_plugin_platform_interface.dart';

class MyFlutterPlugin {
  Future<String?> getPlatformVersion() {
    return MyFlutterPluginPlatform.instance.getPlatformVersion();
  }

  Future<bool?> isCameraAvaible() {
      return MyFlutterPluginPlatform.instance.isCameraAvaible();
  }

  Future<String?> whatYourName() {
    return MyFlutterPluginPlatform.instance.whatYourName();
  }
}
