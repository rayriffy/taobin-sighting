//
//  TaobinHandler.swift
//  Taobin Sighting
//
//  Created by Phumrapee Limpianchop on 2022/09/18.
//

import MapKit
import Alamofire

public class TaobinHandler: ObservableObject {
  @Published var taobinMachines: [TaobinDetail] = []
  
  var dataRequestTemp: DataRequest?
  
  public func fetchTaobin(region: MKCoordinateRegion) {
    if (dataRequestTemp != nil) {
      dataRequestTemp?.cancel()
    }
    
    dataRequestTemp = AF.request(
      "\(Config.apiUrl)/locate",
      method: .get,
      parameters: [
        "lat": region.center.latitude,
        "lon": region.center.longitude,
        "latDelta": region.span.latitudeDelta,
        "lonDelta": region.span.longitudeDelta
      ]
    ).responseDecodable(of: APIResponseWithData<[TaobinDetail]>.self) { response in
      switch response.result {
      case .success(let apiLocateResponse):
        self.taobinMachines.append(
          contentsOf: apiLocateResponse.data.filter { apiItem in
            return !self.taobinMachines.contains(where: { $0.id == apiItem.id })
          }
        )
        self.dataRequestTemp = nil
        break
      case .failure(let error):
        print("failed to fetch GET /api/locate: \(error)")
        break
      }
    }
  }
}
