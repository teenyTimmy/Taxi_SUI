//
//  LocationSearchViewModel.swift
//  Taxi_SUI
//
//  Created by Tim Fedorchenko on 2/28/23.
//

import Foundation
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject {
    // MARK: - Properties
    
    @Published var results = [MKLocalSearchCompletion]()
    
    private let searchComleter = MKLocalSearchCompleter()
    var queryFragment: String = "" {
        didSet {
            searchComleter.queryFragment = queryFragment
        }
    }
    
    override init() {
        super.init()
        
        searchComleter.delegate = self
        searchComleter.queryFragment = queryFragment
    }
}

// MARK: - MKLocalSearchCompleterDelegate

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
