//
//  DetailsView.swift
//  PrampB
//
//  Created by Della Anjeh on 3/3/25.
//


import SwiftUI

struct DetailsView: View {
    var breed: Breed
    var body: some View {
        VStack(spacing: 10) {
            Text(breed.name)
                .font(.headline)
            Text(breed.origin)
                .italic()
            Text(breed.description)
        }
        .padding()
    }
}

#Preview {
    DetailsView(breed: Breed.mock)
}