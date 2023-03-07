//
//  MapViewActionButton.swift
//  Taxi_SUI
//
//  Created by Tim Fedorchenko on 2/28/23.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        Button {
            withAnimation(.spring()) {
                actionForState(mapState)
            }
        } label: {
            Image(systemName: imageNameForState(mapState))
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func actionForState(_ state: MapViewState) -> Void {
        switch state {
        case .noInput:
            print("DEBUG: No input")
        case .locationSelected:
            mapState = .noInput
            viewModel.selectedLocation = nil
        case .searchingForLocation:
            mapState = .noInput
        }
    }
    
    func imageNameForState(_ state: MapViewState) -> String {
        switch state {
        case .noInput:
            return "line.3.horizontal"
        case .locationSelected, .searchingForLocation:
            return "chevron.left"
        }
    }
}

struct MapViewActionButton_Previews: PreviewProvider {
    static var previews: some View {
        MapViewActionButton(
            mapState: .constant(.noInput)
        )
    }
}
