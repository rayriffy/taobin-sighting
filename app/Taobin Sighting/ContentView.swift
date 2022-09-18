//
//  ContentView.swift
//  Taobin Sighting
//
//  Created by Phumrapee Limpianchop on 2022/09/18.
//

import MapKit
import SwiftUI

struct ContentView: View {
  @State private var mapRegion = MKCoordinateRegion(
    center: .init(latitude: 13.6969469, longitude: 100.6082823),
    span: .init(latitudeDelta: 0.05, longitudeDelta: 0.05)
  )

  var body: some View {
    ZStack(alignment: .top) {
      Map(coordinateRegion: $mapRegion).ignoresSafeArea()
      Button {} label: {
        HStack {
          Image(systemName: "line.3.horizontal.decrease.circle.fill")
          Text("Filter").font(.headline).fontWeight(.semibold)
        }
      }
        .buttonStyle(.borderedProminent)
        .cornerRadius(8)
        .tint(.white)
        .foregroundColor(.black)
        .frame(maxWidth: .infinity, alignment: .topTrailing)
        .padding(.trailing, 16)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
