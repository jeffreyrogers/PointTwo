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
    @State internal var point1 = CLLocation(latitude: 0, longitude: 0)
    @State internal var point2 = CLLocation(latitude: 0, longitude: 0)
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
                        point1 = LVM.userLocation
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
