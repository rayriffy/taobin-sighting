//
//  TaobinDetail.swift
//  Taobin Sighting
//
//  Created by Phumrapee Limpianchop on 2022/09/18.
//

import Foundation

public struct TaobinDetail: Codable, Identifiable {
  public var id: Int

  var name: String
  var features: [String]
  var imageUrl: String
  var location: TaobinLocation
}
