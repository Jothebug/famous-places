//
//  LocationsViewModel.swift
//  famous-places
//
//  Created by HaYen on 7/4/25.
//

import Foundation

class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
