//
//  ContentView.swift
//  PointTwo
//
//  Created by Jeffrey Rogers on 6/7/21.
//

import SwiftUI
import CoreLocation

class P2Location: CLLocation, RawRepresentable {
    init(location: CLLocation) {
        super.init(coordinate: location.coordinate, altitude: location.altitude, horizontalAccuracy: location.horizontalAccuracy, verticalAccuracy: location.verticalAccuracy, timestamp: location.timestamp)
    }
    
    override convenience init() {
        self.init(location: CLLocation(latitude: 0, longitude: 0))
    }
    
    required convenience init(rawValue: String) {
        guard let data = Data(base64Encoded: rawValue) else {
            self.init()
            return
        }
        
        do {
            let loc = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? P2Location ?? P2Location()
            self.init(location: loc)
        } catch {
            self.init()
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public var rawValue: String {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: false) as Data
            return data.base64EncodedString()
        } catch {
            return ""
        }
    }
    
}

struct ContentView: View {
    @ObservedObject var LVM = LocationViewModel()
    @SceneStorage("point1") var point1 = P2Location()
    @SceneStorage("point2") var point2 = P2Location()
    @State private var distance = 0.0

    var body: some View {
        VStack() {
            Group {
                Text("Current Location")
                    .font(.title)
                    .padding()
                
                LocationView(point: LVM.userLocation)
            }.padding()

            Divider()

            VStack {
                VStack {
                    Text("Point 1")
                        .font(.title2)
                        .padding()
                    LocationView(point: point1)
                    Button("Store Point 1") {
                        point1 = P2Location(location: LVM.userLocation)
                        distance = point2.distance(from: point1)
                    }
                    .padding()
                }.padding()
                VStack {
                    Text("Point 2")
                        .font(.title2)
                        .padding()
                    LocationView(point: point2)
                    Button("Store Point 2") {
                        point2 = P2Location(location: LVM.userLocation)
                        distance = point1.distance(from: point2)
                    }
                    .padding()
                }.padding()
            }.padding()

            Divider()

            Group {
                Text("\(distance) meters from Point 1 to Point 2")
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
