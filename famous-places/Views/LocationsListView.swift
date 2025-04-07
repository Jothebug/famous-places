//
//  LocationsListView.swift
//  famous-places
//
//  Created by HaYen on 7/4/25.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) {location in
                HStack {
                    if let imageName = location.imageNames.first {
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                            .cornerRadius(10)
                    }
                    VStack(alignment: .leading) {
                        Text(location.name)
                            .font(.headline)
                        Text(location.cityName)
                            .font(.subheadline)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}
