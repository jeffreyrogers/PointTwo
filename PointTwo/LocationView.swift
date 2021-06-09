//
//  LocationView.swift
//  PointTwo
//
//  Created by Jeffrey Rogers on 6/8/21.
//

import SwiftUI
import CoreLocation

struct LocationView : View {
    internal var point: CLLocation
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text("Lat:").frame(maxWidth: 40, alignment: .leading)
                Text("Lon:").frame(maxWidth: 40, alignment: .leading)
                Text("Alt:").frame(maxWidth: 40, alignment: .leading)
            }
            VStack {
                Text("\(point.coordinate.latitude)").frame(maxWidth: 120, alignment: .trailing)
                Text("\(point.coordinate.longitude)").frame(maxWidth: 120, alignment: .trailing)
                Text("\(point.altitude)").frame(maxWidth: 120, alignment: .trailing)
            }
            Spacer()
        }
    }
}
