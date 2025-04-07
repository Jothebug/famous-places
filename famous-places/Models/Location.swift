//
//  Location.swift
//  famous-places
//
//  Created by HaYen on 7/4/25.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    // Identifiable
    // This is a computed property — not a stored one. That's why it writes like the below.
    var id: String { name + cityName }
    
    // Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
