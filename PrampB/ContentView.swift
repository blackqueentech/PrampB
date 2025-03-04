//
//  ContentView.swift
//  PrampB
//
//  Created by Della Anjeh on 3/3/25.
//

import SwiftUI

struct ContentView: View {
    let dataService: BreedDataServiceProtocol
    @State private var breeds: [Breed] = []
    
    init(dataService: BreedDataServiceProtocol) {
        self.dataService = dataService
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if breeds.isEmpty {
                    Text("No breeds found")
                        .padding()
                } else {
                    List(breeds, id: \.id) { breed in
                        NavigationLink {
                            DetailsView(breed: breed)
                        } label: {
                            VStack(alignment: .leading) {
                                Text(breed.name)
                                    .font(.headline)
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
            .task {
                await dataService.loadData()
                // Update local state with data from service
                breeds = dataService.results
            }
            .navigationTitle("Catssss")
        }
    }
}

#Preview {
    let dataService = BreedProductionDataService()
    ContentView(dataService: dataService)
}
