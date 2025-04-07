//
//  LocationsView.swift
//  famous-places
//
//  Created by HaYen on 7/4/25.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea() // before using this method, map doesnt show fullscreen
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
