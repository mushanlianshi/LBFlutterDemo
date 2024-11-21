//
//  LBEventChannelManager.swift
//  my_flutter_plugin
//
//  Created by liu bin on 2024/11/20.
//
import Flutter
import Foundation

class LBEventChannelManager: NSObject {
    
    static let shared = LBEventChannelManager()
    
    private var gcdTimer: DispatchSourceTimer?
    
//    private var sinkBlock:((_ event: AnyObject) -> Void)?
    private var sinkBlock: FlutterEventSink?

    var count = 0
    
    override init(){
    super.init()
        gcdTimer = DispatchSource.makeTimerSource(queue: .main)
        gcdTimer?.schedule(deadline: .now(), repeating: .seconds(3))
        gcdTimer?.setEventHandler(handler: DispatchWorkItem(block: {
            [weak self] in
                        guard let self = self else { return }
                        if self.count % 2 == 0{
                            self.sinkBlock?(["eletronicLevel" : "ddd"])
                        }else{
                            self.sinkBlock?(["eletronicLevel222" : "ddd"])
                        }
                        self.count += 1
        }))
        gcdTimer?.resume()
    }
    
    
}

/// 处理eventChannel
extension LBEventChannelManager: FlutterStreamHandler{
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
            debugPrint("LBLog argument is \(arguments)")
        self.sinkBlock = events
        if let arg = arguments as? [String: Any] {
            
        }
        return nil
    }
    
    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        self.sinkBlock = nil
        return nil
    }
    
    
}
