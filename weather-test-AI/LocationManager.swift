// Remember to add NSLocationWhenInUseUsageDescription in Info.plist
/*
 import Foundation
 import CoreLocation
 import Combine
 
 final class LocationManager: NSObject, ObservableObject {
 @Published var authorizationStatus: CLAuthorizationStatus
 @Published var currentLocation: CLLocation?
 
 private let manager = CLLocationManager()
 
 override init() {
 self.authorizationStatus = manager.authorizationStatus
 super.init()
 manager.delegate = self
 manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
 }
 
 func requestAuthorization() {
 if authorizationStatus == .notDetermined {
 manager.requestWhenInUseAuthorization()
 }
 }
 
 func start() {
 manager.startUpdatingLocation()
 }
 
 func stop() {
 manager.stopUpdatingLocation()
 }
 }
 
 extension LocationManager: CLLocationManagerDelegate {
 func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
 DispatchQueue.main.async { [weak self] in
 self?.authorizationStatus = manager.authorizationStatus
 if manager.authorizationStatus == .authorizedWhenInUse || manager.authorizationStatus == .authorizedAlways {
 self?.start()
 }
 }
 }
 
 func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
 guard let loc = locations.last else { return }
 DispatchQueue.main.async { [weak self] in
 self?.currentLocation = loc
 }
 }
 
 func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
 // Keep it simple for now
 print("Location error: \(error)")
 }
 }
 */
