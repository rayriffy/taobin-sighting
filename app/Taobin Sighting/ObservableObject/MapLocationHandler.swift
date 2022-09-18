//
//  MapLocationHandler.swift
//  Taobin Sighting
//
//  Created by Phumrapee Limpianchop on 2022/09/18.
//

import Foundation
import MapKit

public class MapLocationHandler: NSObject, ObservableObject, CLLocationManagerDelegate {
  var locationManager: CLLocationManager?
  
  func checkIfLocationServicesEnabled() {
    if CLLocationManager.locationServicesEnabled() {
      locationManager = CLLocationManager()
      locationManager!.delegate = self
//      checkLocationAuthorization()
//      locationManager?.desiredAccuracy = kCLLocationAccuracyBest
    } else {
      print("warn: no location allowed")
    }
  }
  
  private func checkLocationAuthorization() {
    guard let locationManager = locationManager else { return }
    
    switch(locationManager.authorizationStatus) {
    case .notDetermined:
      locationManager.requestWhenInUseAuthorization()
    case .restricted:
      print("location is restricted due to parental controls")
    case .denied:
      print("location permission denined")
    case .authorizedAlways, .authorizedWhenInUse:
      break
    @unknown default:
      break
    }
  }
  
  public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    checkLocationAuthorization()
  }
}
