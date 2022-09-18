//
//  TaobinLocation.swift
//  Taobin Sighting
//
//  Created by Phumrapee Limpianchop on 2022/09/18.
//

import Foundation

public struct TaobinLocation: Codable {
  var locateGuide: String
  var geo: TaobinGeo
}

public struct TaobinGeo: Codable {
  var lat: Double
  var lon: Double
}
