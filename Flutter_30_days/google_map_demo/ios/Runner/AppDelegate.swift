import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    
    GeneratedPluginRegistrant.register(with: self)
    
    GMSServices.provideAPIKey("AIzaSyAEUpc_txTD8_FZQm2WjNwas0PLqTQFikY")
//    let mananer = CLLocationManager.init()
//    mananer.requestLocation()
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
