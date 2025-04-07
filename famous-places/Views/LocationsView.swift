//
//  LocationsView.swift
//  famous-places
//
//  Created by HaYen on 7/4/25.
//

import SwiftUI

struct LocationsView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) {
                Text($0.name)
            }
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
