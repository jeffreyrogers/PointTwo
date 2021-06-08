//
//  ContentView.swift
//  PointTwo
//
//  Created by Jeffrey Rogers on 6/7/21.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @ObservedObject var LVM = LocationViewModel()
    @State private var point1 = CLLocation(latitude: 0, longitude: 0)
    @State private var point2 = CLLocation(latitude: 0, longitude: 0)
    @State private var distance = 0.0
    
    var body: some View {
        VStack() {
            Group {
                Text("Current Location")
                    .font(.title)
                    .padding()
                
                HStack {
                    Spacer()
                    VStack {
                        Text("Lat:").frame(maxWidth: 40, alignment: .leading)
                        Text("Lon:").frame(maxWidth: 40, alignment: .leading)
                        Text("Alt:").frame(maxWidth: 40, alignment: .leading)
                    }
                    VStack {
                        Text("\(LVM.userLocation.coordinate.latitude)").frame(maxWidth: 120, alignment: .trailing)
                        Text("\(LVM.userLocation.coordinate.longitude)").frame(maxWidth: 120, alignment: .trailing)
                        Text("\(LVM.userLocation.altitude)").frame(maxWidth: 120, alignment: .trailing)
                    }
                    Spacer()
                }.padding()
            }.padding()

            Divider()

            HStack {
                VStack {
                    Text("Point 1")
                        .font(.title2)
                        .padding()
                    Text("Lat: \(point1.coordinate.latitude)")
                    Text("Lon: \(point1.coordinate.longitude)")
                    Text("Alt: \(point1.altitude)")
                    Button("Store Point 1") {
                        point1 = LVM.userLocation
                        distance = point2.distance(from: point1)
                    }
                    .padding()
                }.padding()
                Spacer()
                VStack {
                    Text("Point 2")
                        .font(.title2)
                        .padding()
                    Text("Lat: \(point2.coordinate.latitude)")
                    Text("Lon: \(point2.coordinate.longitude)")
                    Text("Alt: \(point2.altitude)")
                    Button("Store Point 2") {
                        point2 = LVM.userLocation
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
