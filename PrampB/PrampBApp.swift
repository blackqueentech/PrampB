//
//  PrampBApp.swift
//  PrampB
//
//  Created by Della Anjeh on 3/3/25.
//

import SwiftUI

@main
struct PrampAApp: App {
    @State private var dataService = BreedProductionDataService()
    
    var body: some Scene {
        WindowGroup {
            ContentView(dataService: dataService)
                .task {
                    await dataService.loadData()
                }
        }
    }
}

