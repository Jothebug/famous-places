//
//  Location.swift
//  famous-places
//
//  Created by HaYen on 7/4/25.
//

import Foundation
import MapKit

struct Location {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
}
