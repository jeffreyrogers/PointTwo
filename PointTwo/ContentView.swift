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
    
    var body: some View {
        VStack() {
            Text("Your Location Is")
            HStack {
                Text("Latitude: \(LVM.userLocation.coordinate.latitude)")
                Text("Longitude: \(LVM.userLocation.coordinate.longitude)")
                Text("Altitude: \(LVM.userLocation.altitude)")
            }
        }
//        VStack() {
//            Text("Point 1")
//                .padding()
//            Button("Set Point 1") {
//
//            }
//            Spacer()
//            Text("Point 2")
//                .padding()
//            Button("Set Point 2") {
//
//            }
//            Spacer()
//            Divider()
//            Text("Distance (m)")
//                .padding()
//            Text("")
//                .padding()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
