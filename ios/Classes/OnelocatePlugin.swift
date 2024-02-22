import Flutter
import UIKit
import Foundation

public class OnelocatePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "onelocate", binaryMessenger: registrar.messenger())
    let instance = OnelocatePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
        result("iOS " + UIDevice.current.systemVersion)
    case "getLocation":
        DispatchQueue.main.async {
          let url = URL(string: "http://ip-api.com/json")!
          let task = URLSession.shared.dataTask(with: url) { data, response, error in
              guard
                  error == nil,
                  let data = data,
                  let string = String(data: data, encoding: .utf8)
              else {
                  print(error ?? "Unknown error")
                  return
              }
              let dict = string.toJSON() as? [String:AnyObject]
              let requestParams = [
                "country": dict?["country"],
                "countryCode": dict?["countryCode"],
                "city": dict?["city"],
                "zip": dict?["zip"],
                "lat": dict?["lat"],
                "lon": dict?["lon"],
                ]
              result(requestParams)
          }
          task.resume()
        }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}

extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}
