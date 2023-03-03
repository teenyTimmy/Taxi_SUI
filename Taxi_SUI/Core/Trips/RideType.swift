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
}
