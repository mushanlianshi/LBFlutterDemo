import 'package:get/get.dart';
import 'package:lb_flutter_project/localPlugin/my_flutter_plugin/example/ios/.symlinks/plugins/my_flutter_plugin/example/ios/.symlinks/plugins/my_flutter_plugin/example/ios/.symlinks/plugins/my_flutter_plugin/example/ios/.symlinks/plugins/my_flutter_plugin/example/ios/.symlinks/plugins/my_flutter_plugin/example/ios/.symlinks/plugins/my_flutter_plugin/example/ios/.symlinks/plugins/my_flutter_plugin/example/ios/.symlinks/plugins/my_flutter_plugin/example/ios/.symlinks/plugins/my_flutter_plugin/example/ios/.symlinks/plugins/my_flutter_plugin/example/ios/.symlinks/plugins/my_flutter_plugin/example/ios/.symlinks/plugins/my_flutter_plugin/example/ios/.symlinks/plugins/my_flutter_plugin/example/ios/.symlinks/plugins/my_flutter_plugin/example/ios/.symlinks/plugins/my_flutter_plugin/example/ios/.symlinks/plugins/my_flutter_plugin/example/ios/.symlinks/plugins/my_flutter_plugin/example/ios/.symlinks/plugins/my_flutter_plugin/lib/my_flutter_plugin.dart';

import 'local_plugin_state.dart';

class LocalPluginLogic extends GetxController {

  final LocalPluginState state = LocalPluginState();

  final nameObs = "".obs;
  final versionObs = "".obs;
  final isAvaliableObs = false.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("LBLog LocalPluginLogic onInit ----------");
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print("LBLog LocalPluginLogic onReady ----------");
  }




  refreshPluginValue() async{
     String? name =  await MyFlutterPlugin().whatYourName();
     String? version =  await MyFlutterPlugin().getPlatformVersion();
     bool? isAvalable =  await MyFlutterPlugin().isCameraAvaible();
     nameObs.value = name ?? "";
     versionObs.value = version ?? "";
     isAvaliableObs.value = isAvalable ?? false;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("LBLog LocalPluginLogic onClose ----------");
  }
}
