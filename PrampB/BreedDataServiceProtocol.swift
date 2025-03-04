//
//  BreedDataServiceProtocol.swift
//  PrampB
//
//  Created by Della Anjeh on 3/3/25.
//


import Foundation
import SwiftUI

protocol BreedDataServiceProtocol {
    func loadData() async
    var results: [Breed] { get }
}

@MainActor
class BreedProductionDataService: BreedDataServiceProtocol {
    @Published var results: [Breed] = []
    
    init(results: [Breed]? = nil) {
        self.results = results ?? []
    }
    
    func loadData() async {
        let apiKey = ""
        guard let url = URL(string: "https://api.thecatapi.com/v1/breeds?api_key=\(apiKey)")
        else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode([Breed].self, from: data)
            results = decodedResponse
            print("Loaded \(results.count) breeds")
        } catch {
            print("Invalid data, see error: \(error)")
        }
    }
}

class BreedMockDataService: BreedDataServiceProtocol {
    var results: [Breed] = []
    
    init(results: [Breed]) {
        self.results = results
    }
    
    func loadData() async {
        
    }
}
