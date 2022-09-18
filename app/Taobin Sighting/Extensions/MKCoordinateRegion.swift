//
//  MKCoordinateRegion.swift
//  Taobin Sighting
//
//  Created by Phumrapee Limpianchop on 2022/09/18.
//

import MapKit

extension MKCoordinateRegion: Equatable {
  public static func == (lhs: MKCoordinateRegion, rhs: MKCoordinateRegion) -> Bool {
    if (
      lhs.center.latitude == rhs.center.latitude &&
      lhs.span.latitudeDelta == rhs.span.latitudeDelta &&
      lhs.span.longitudeDelta == rhs.span.longitudeDelta
    ) {
      return true
    } else {
      return false
    }
  }
}
