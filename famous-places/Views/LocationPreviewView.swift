//
//  LocationPreviewView.swift
//  famous-places
//
//  Created by HaYen on 8/4/25.
//

import SwiftUI

struct LocationPreviewView: View {
    let location: Location
    
    var body: some View {
        HStack {
            VStack(spacing: 16) {
                imageSection
                titleSection
            }
            
            VStack {
                Button {
                    
                } label: {
                    Text("Learn more")
                        .font(.headline)
                        .frame(width: 125, height: 30)
                }
                .buttonStyle(MyCustomButtonStyle(backgroundColor: Color.red, foregroundColor: Color.white))
                Button {
                    
                } label: {
                    Text("Next")
                        .font(.headline)
                        .frame(width: 125, height: 30)
                }
                .buttonStyle(MyCustomButtonStyle(backgroundColor: .clear, foregroundColor: Color.red))
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        LocationPreviewView(location: DEFAULT_LOCATION)
    }
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
    }
}
