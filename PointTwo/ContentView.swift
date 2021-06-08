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
                Spacer()
                Text("Current Location")
                Text("Lat: \(LVM.userLocation.coordinate.latitude)")
                Text("Long: \(LVM.userLocation.coordinate.longitude)")
                Text("Alt: \(LVM.userLocation.altitude)")
                Spacer()
            }

            Divider()

            HStack {
                VStack {
                    Text("Point 1")
                    Text("Lat: \(point1.coordinate.latitude)")
                    Text("Long: \(point1.coordinate.longitude)")
                    Text("Alt: \(point1.altitude)")
                    Button("Store Point 1") {
                        point1 = LVM.userLocation
                    }
                }

                VStack {
                    Text("Point 2")
                    Text("Lat: \(point2.coordinate.latitude)")
                    Text("Long: \(point2.coordinate.longitude)")
                    Text("Alt: \(point2.altitude)")
                    Button("Store Point 2") {
                        point2 = LVM.userLocation
                    }
                }
            }

            Divider()

            Group {
                Spacer()
                Text("\(distance) meters from point 1 to point 2")
                Button("Calculate Distance") {
                    distance = point1.distance(from: point2)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
