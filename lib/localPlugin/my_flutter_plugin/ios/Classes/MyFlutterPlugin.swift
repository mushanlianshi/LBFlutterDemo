import Flutter
import UIKit

public class MyFlutterPlugin: NSObject, FlutterPlugin {
    
  public static func register(with registrar: FlutterPluginRegistrar) {
      /// method channel
    let methodChannel = FlutterMethodChannel(name: "my_flutter_plugin", binaryMessenger: registrar.messenger())
    
    let instance = MyFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: methodChannel)
      
    /// event channel
    let eventChannel = FlutterEventChannel(name: "my_flutter_plugin_event_channel", binaryMessenger: registrar.messenger())
      eventChannel.setStreamHandler(LBEventChannelManager.shared)
  }


  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "isCameraAviable":
        result(MyCameraUtil.isCameraAvailable())
    case "whatYourName":
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            result("刘彬");
        })
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}

