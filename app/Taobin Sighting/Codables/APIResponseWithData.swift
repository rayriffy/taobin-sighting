//
//  APIResponseWithData.swift
//  Taobin Sighting
//
//  Created by Phumrapee Limpianchop on 2022/09/18.
//

import Foundation

struct APIResponseWithData<T : Codable>: Codable {
  var message: String
  var data: T
}
