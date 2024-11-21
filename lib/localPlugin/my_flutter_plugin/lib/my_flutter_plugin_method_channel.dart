import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'my_flutter_plugin_platform_interface.dart';

typedef EventCallback = void Function(dynamic content);
/// An implementation of [MyFlutterPluginPlatform] that uses method channels.
class MethodChannelMyFlutterPlugin extends MyFlutterPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('my_flutter_plugin');

  final eventChannel = const EventChannel("my_flutter_plugin_event_channel");

  bool _hasRegisterEventChannel = false;

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool?> isCameraAvaible() async{
    final avaible = await methodChannel.invokeMethod<bool>('isCameraAviable');
    if (avaible is bool){
      return avaible;
    }else{
      return false;
    }
  }

  @override
  Future<String?> whatYourName() async{
    final name = await methodChannel.invokeMethod<String>('whatYourName');
      return name;
  }

  @override
  electronicLevel(EventCallback callBack){
    /// 发送消息  监听
    eventChannel.receiveBroadcastStream({"type":"eletronicLevel","value" : "777"}).asBroadcastStream().listen((event) {
      callBack(event);
    });
  }




}
