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
    let maxWidthForIpad: CGFloat = 700
    
    var body: some View {
        ZStack {
            mapLayer
                .ignoresSafeArea() // before using this method, map doesnt show fullscreen
            VStack(spacing: 0) {
                header
                    .padding()
                    .frame(maxWidth: maxWidthForIpad)
                Spacer()
                locationsPreviewStack
            }
        }
        .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

extension LocationsView {
    private var header: some View {
        VStack {
            Button(action: vm.toggleLocationsList, label: {
                HStack {
                       Image(systemName: "arrow.down")
                           .font(.headline)
                           .foregroundColor(.primary)
                           .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                           .padding(.trailing, 4)
                       Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                           .font(.title2)
                           .fontWeight(.black)
                           .foregroundColor(.primary)
                           .lineLimit(1)
                           .truncationMode(.tail)
                       Spacer()
                   }
                   .frame(height: 55)
                   .frame(maxWidth: .infinity)
                   .animation(.none, value: vm.mapLocation) // stop applying animation, because the vm.toggleLocationsList is covered with withAnimation.
                   .padding(.horizontal)
            })
            if vm.showLocationsList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y:15)
    }
    
    private var mapLayer: some View {
        Map(
            coordinateRegion: $vm.mapRegion,
            annotationItems: vm.locations,
            annotationContent: { location in
                MapAnnotation(coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                        .shadow(radius: 10)
                        .onTapGesture {
                            vm.showNextLocation(location: location)
                        }
                }
            })
    }
    
    private var locationsPreviewStack: some View {
        ZStack {
            ForEach(vm.locations) { location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .frame(maxWidth: maxWidthForIpad)
                        .frame(maxWidth: .infinity)
                    // associates a transition with the view above not the view of maxWidth: maxWidthForIpad
                        .transition(
                            .asymmetric(
                                insertion: .move(edge: .trailing),
                                removal: .move(edge: .leading))
                        )
                }
            }
        }
    }
}
