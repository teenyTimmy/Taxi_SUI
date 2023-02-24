//
//  HomeView.swift
//  Taxi_SUI
//
//  Created by Tim Fedorchenko on 2/25/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        MapViewRepresentable()
            .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
