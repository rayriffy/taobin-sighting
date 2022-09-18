//
//  TaobinOverlayView.swift
//  Taobin Sighting
//
//  Created by Phumrapee Limpianchop on 2022/09/19.
//

import SwiftUI

struct TaobinOverlayView: View {
  @Binding var machine: TaobinDetail?
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Spacer()
      }

      Text(self.machine?.name ?? "")
        .font(.title)
        .bold()
        .multilineTextAlignment(.leading)
        .padding(.bottom, 1)
      
      HStack {
        ForEach(self.machine?.features ?? [], id: \.self) { feature in
          TaobinFeature(feature: feature)
          .padding(.trailing, 4)
        }
      }
      .padding(.bottom, 12)
      
      VStack(alignment: .leading) {
        Text("Where is it located?")
          .font(.subheadline)
          .textCase(.uppercase)
          .bold()
          .foregroundColor(.secondary)
        Text(self.machine?.location.locateGuide ?? "")
          .font(.body)
          .padding(.top, 1)
      }
      
      Spacer()
    }
    .padding()
    .padding(.top, 6)
  }
}
