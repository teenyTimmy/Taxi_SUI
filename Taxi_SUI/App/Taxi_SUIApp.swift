//
//  Taxi_SUIApp.swift
//  Taxi_SUI
//
//  Created by Tim Fedorchenko on 2/25/23.
//

import SwiftUI

@main
struct Taxi_SUIApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
