import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lb_flutter_project/Util/BLTEmptyCheck.dart';
import 'package:lb_flutter_project/localPlugin/my_flutter_plugin/lib/my_flutter_plugin.dart';

import 'local_plugin_state.dart';

class LocalPluginLogic extends GetxController {

  final LocalPluginState state = LocalPluginState();

  final nameObs = "".obs;
  final versionObs = "".obs;
  final isAvaliableObs = false.obs;
  final electronicObs = "".obs;
  final electronic22Obs = "".obs;


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

     electronicObs.listen((p0) {
       debugPrint("LBLog electronicObs ------ ${p0}");
     });
     electronicObs.listen((p0) {
       debugPrint("LBLog electronicObs ---222--- ${p0}");
     });
  }

  listEventChannel() async{
      MyFlutterPlugin().eletronicLevel((content) {
        if (content is Map<Object?, Object?>){
          Map<Object?, Object?> tmpContent = content;
          Map<String, dynamic> map  = Map<String, dynamic>();
          tmpContent.forEach((key, value) {
                map[key.toString()] = value.toString();
           });
          if(BLTEmptyCheck.isNotEmpty<String>(map["eletronicLevel"])){
            electronicObs.value = map["eletronicLevel"];

          }

        }
      });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("LBLog LocalPluginLogic onClose ----------");
  }
}
