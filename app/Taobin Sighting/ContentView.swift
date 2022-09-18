//
//  ContentView.swift
//  Taobin Sighting
//
//  Created by Phumrapee Limpianchop on 2022/09/18.
//

import MapKit
import SwiftUI
import DebouncedOnChange
import TailwindColor

struct ContentView: View {
  @State private var mapRegion = MKCoordinateRegion(
    center: .init(latitude: 13.6969469, longitude: 100.6082823),
    span: .init(latitudeDelta: 0.02, longitudeDelta: 0.02)
  )
  @StateObject private var taobinHandler = TaobinHandler()
  @StateObject private var mapLocationHandler = MapLocationHandler()
  
  @State private var presentSheet = false
  @State var selectedMachine: TaobinDetail? {
    didSet {
      self.presentSheet = true
    }
  }

  var body: some View {
    ZStack(alignment: .top) {
      Map(
        coordinateRegion: $mapRegion,
        interactionModes: .all,
        showsUserLocation: true,
        userTrackingMode: nil,
        annotationItems: taobinHandler.taobinMachines
      ) { machine in
        MapAnnotation(
          coordinate: .init(latitude: machine.location.geo.lat, longitude: machine.location.geo.lon)
        ) {
          Image(systemName: machine.features.contains("outdoor") ? "beach.umbrella" : "building.2")
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundColor(.white)
            .padding(10)
            .background(machine.features.contains("outdoor") ? TailwindColor.orange500 : TailwindColor.blue500)
            .clipShape(Circle())
            .onTapGesture {
              self.selectedMachine = machine
            }
        }
      }
      .onAppear {
        mapLocationHandler.checkIfLocationServicesEnabled()
      }
      .ignoresSafeArea()
      Button {} label: {
        HStack {
          Image(systemName: "line.3.horizontal.decrease.circle.fill")
          Text("Filter").font(.headline).bold().textCase(.uppercase)
        }
      }
      .buttonStyle(.borderedProminent)
      .cornerRadius(8)
      .tint(.white)
      .foregroundColor(.black)
      .frame(maxWidth: .infinity, alignment: .topTrailing)
      .padding(.trailing, 16)
    }
    .onChange(of: mapRegion, debounceTime: 0.4) { newRegion in
      print(">>> \(newRegion.center.latitude)")
      taobinHandler.fetchTaobin(region: newRegion)
    }
    .sheet(isPresented: $presentSheet) {
      TaobinOverlayView(machine: $selectedMachine)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
