//
//  RideType.swift
//  Taxi_SUI
//
//  Created by Tim Fedorchenko on 3/3/23.
//

import Foundation

enum RideType: Int, CaseIterable, Identifiable {
    case uberX
    case uberXL
    case uberBlack
    case uberBlackSuv
    
    var id: Int { return rawValue }
    
    var description: String {
        switch self {
        case .uberX: return "UberX"
        case .uberXL: return "UberXL"
        case .uberBlack: return "UberBlack"
        case .uberBlackSuv: return "UberSV"
        }
    }
    
    var imageName: String {
        switch self {
        case .uberX: return "uber-x"
        case .uberXL: return "uber-xl"
        case .uberBlack: return "uber-black"
        case .uberBlackSuv: return "uber-black-suv"
        }
    }
    
    var baseFare: Double {
        switch self {
        case .uberX: return 5
        case .uberXL: return 9
        case .uberBlack: return 19
        case .uberBlackSuv: return 23
        }
    }
    
    func computePrice(for distanceInMeters: Double) -> Double {
        let distanceInMiles = distanceInMeters / 1600
        
        switch self {
        case .uberX: return distanceInMiles * 1.5 + baseFare
        case .uberXL: return distanceInMiles * 1.85 + baseFare
        case .uberBlack: return distanceInMiles * 2.3 + baseFare
        case .uberBlackSuv: return distanceInMiles * 2.5 + baseFare
        }
    }
}
