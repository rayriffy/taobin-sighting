//
//  TaobinMarker.swift
//  Taobin Sighting
//
//  Created by Phumrapee Limpianchop on 2022/09/19.
//

import SwiftUI

struct TaobinFeature: View {
  public var feature: String

  var body: some View {
    HStack {
      Image(systemName: feature == "outdoor" ? "beach.umbrella" : "building.2")
      Text(feature).textCase(.uppercase).font(.subheadline).fontWeight(.semibold)
    }
    .foregroundColor(.secondary)
  }
}
