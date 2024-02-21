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
       let url = URL(string: "http://ip-api.com/json")
           var request = URLRequest(url: url!)
           request.httpMethod = "POST"
           let urlstr = "id=5&name=aaa"
           request.httpBody = urlstr.data(using: .utf8)!
           let session = URLSession.shared
           session.dataTask(with: request) { (data, response, error) in
               if error == nil, let data = data, let response = response as? HTTPURLResponse {
                   print("Content-Type: \(response.allHeaderFields["Content-Type"] ?? "")")
                   print("statusCode: \(response.statusCode)")
                   completion(response.statusCode)
                   print(String(data: data, encoding: .utf8) ?? "")
               } else {
                   completion(404)
               }
           }.resume()
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
