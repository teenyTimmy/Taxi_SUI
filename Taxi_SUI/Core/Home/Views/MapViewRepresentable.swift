//
//  MapViewRepresentable.swift
//  Taxi_SUI
//
//  Created by Tim Fedorchenko on 2/25/23.
//

import SwiftUI
import MapKit

struct MapViewRepresentable: UIViewRepresentable {
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    let mapView = MKMapView()
    let locationManager = LocationManager()
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let coordinate = locationViewModel.selectedLocationCoordinate {
            context.coordinator.addAndSelectAnnotation(withCoordinate: coordinate)
        }
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension MapViewRepresentable {
    class MapCoordinator: NSObject, MKMapViewDelegate {
        // MARK: - Properties
        
        let parent: MapViewRepresentable
        
        // MARK: - Lifecycle
        
        init(parent: MapViewRepresentable) {
            self.parent = parent
            
            super.init()
        }
        
        // MARK: - MKMapViewDelegate
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region  = MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: userLocation.coordinate.latitude,
                    longitude: userLocation.coordinate.longitude
                ),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
            
            parent.mapView.setRegion(region, animated: true)
        }
        
        // MARK: - Helpers
        
        func addAndSelectAnnotation(withCoordinate coordinate: CLLocationCoordinate2D) {
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            
            let anno = MKPointAnnotation()
            
            anno.coordinate = coordinate
            
            parent.mapView.addAnnotation(anno)
            parent.mapView.deselectAnnotation(anno, animated: true)
            parent.mapView.showAnnotations(parent.mapView.annotations, animated: true)
        }
    }
}
