//
//  LocationPreviewView.swift
//  famous-places
//
//  Created by HaYen on 8/4/25.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    let location: Location
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            VStack(spacing: 8) {
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10.0)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .cornerRadius(10)
    }
}

#Preview {
    ZStack {
        Color.green.ignoresSafeArea()
        LocationPreviewView(location: DEFAULT_LOCATION)
            .padding(20)
    }
    .environmentObject(LocationsViewModel())
}

extension LocationPreviewView {
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var titleSection: some View {
        VStack(alignment:.leading) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View {
        Button {
            vm.sheetLocation = location
        } label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 140, height: 30)
        }
        .buttonStyle(MyCustomButtonStyle(backgroundColor: Color.red, foregroundColor: Color.white))
    }
    
    private var nextButton: some View {
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 140, height: 30)
        }
        .buttonStyle(MyCustomButtonStyle(backgroundColor: Color.teal, foregroundColor: Color.red))
    }
}
