//
//  LocationsViewModel.swift
//  famous-places
//
//  Created by HaYen on 7/4/25.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    // All loaded locations
    @Published var locations: [Location]
    // Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        /**
         In the tutorial video uses "self.mapLocation = locations.first!" instead of implementing like me below. I dont follow tutor because I think using ! is kind of risky, ! - the force unwrapping operator want self.mapLocation always has a valid value, but in some case locations.first = nil, so this operator will cause runtime crash. Therefore, I think the implementation below is the safe and smart way.
         */
        guard let firstLocation = locations.first else {
            self.mapLocation = DEFAULT_LOCATION
            self.updateMapRegion(location: DEFAULT_LOCATION)
            return
        }
        // If locations.first is not nil, assign it to mapLocation
        self.mapLocation = firstLocation
        self.updateMapRegion(location: firstLocation)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
}
