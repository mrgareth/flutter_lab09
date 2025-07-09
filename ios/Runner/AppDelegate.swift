import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
  private let channelName = "com.example/calculator"

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let methodChannel = FlutterMethodChannel(name: channelName, binaryMessenger: controller.binaryMessenger)

    methodChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
      guard let args = call.arguments as? [String: Any],
            let num1 = args["num1"] as? Double,
            let num2 = args["num2"] as? Double else {
        result(FlutterError(code: "BAD_ARGS", message: "Argumentos inválidos", details: nil))
        return
      }

      switch call.method {
      case "add":
        result(num1 + num2)
      case "subtract":
        result(num1 - num2)
      case "multiply":
        result(num1 * num2)
      case "divide":
        if num2 == 0 {
          result(FlutterError(code: "DIVIDE_BY_ZERO", message: "División por cero", details: nil))
        } else {
          result(num1 / num2)
        }
      default:
        result(FlutterMethodNotImplemented)
      }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
