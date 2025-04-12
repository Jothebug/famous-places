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
    
    // Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    
    // Show list of locations
    @Published var showLocationsList:Bool = false
    
    // Show location detail via sheet
    @Published var sheetLocation: Location? = nil
    
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
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }
    
    func showNextLocation(location:Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        
        // Get the current index
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            print("Could not find current index in locations array!")
            return
        }
        
        // Check if the currentIndex is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            // Next index is NOT valid
            // Restart from 0
            guard  let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        // Next index is valid
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
