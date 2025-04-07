//
//  famous_placesApp.swift
//  famous-places
//
//  Created by HaYen on 7/4/25.
//

import SwiftUI

@main
struct famous_placesApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
