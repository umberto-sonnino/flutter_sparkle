import Cocoa
import FlutterMacOS
import Sparkle

public class FlutterSparklePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_sparkle", binaryMessenger: registrar.messenger)
    let instance = FlutterSparklePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
    case "checkMacUpdate":
        guard let args = call.arguments else {
                return
              }
        let url = args as? String
        let controller = SPUStandardUpdaterController(startingUpdater: true, updaterDelegate: nil, userDriverDelegate: nil)
        controller.updater.checkForUpdates()
        result("Updating URL: \(controller.updater.feedURL?.absoluteString ?? "no_url")")
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
