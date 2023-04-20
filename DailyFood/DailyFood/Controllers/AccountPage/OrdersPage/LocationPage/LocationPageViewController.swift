//
//  LocationPageViewController.swift
//  DailyFood
//
//  Created by m223 on 18.04.2023.
//

import UIKit
import MapKit
import CoreLocation

class LocationPageViewController: UIViewController {
    
    let maps = MKMapView()
    
    var testArrayAnnotation = ["Харьков, Путиловский переулок", "Шатилова дача, Харьков"]
    
    var annotationArray = [MKPointAnnotation]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
                
        setup()
        layout()
        setupPlaceMark(address: "Харьков, Путиловский переулок")
        setupPlaceMark(address: "Харків, Шатілова дача")
        print("count: \(annotationArray.count)")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            self.createWay()
        }

            
    }
    
    func setup() {
        
        maps.translatesAutoresizingMaskIntoConstraints = false
        
        maps.delegate = self
        
    }
    
    func layout() {
        view.addSubview(maps)
        
        NSLayoutConstraint.activate([
            maps.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            maps.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            maps.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            maps.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
    }
    
    func setupPlaceMark(address: String) {
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address) { [self] (placemarks, error) in
            if let error = error {
                print(error)
                print("some wrong")
                return
            }
            
            guard let placemarks = placemarks else { return }
            let placemark = placemarks.first
            
            let annotation = MKPointAnnotation()
            annotation.title = "\(address)"
            guard let placemarkLocation = placemark?.location else {return}
            annotation.coordinate = placemarkLocation.coordinate
            
            annotationArray.append(annotation)
            
            maps.showAnnotations(annotationArray, animated: true)
            print("functionSetupAnnotation")
        }
    }


    private func createDirectionRequest(startCoordinate: CLLocationCoordinate2D, destinationCoordinate: CLLocationCoordinate2D) {
        
        let startLocation = MKPlacemark(coordinate: startCoordinate)
        let destinationCoordinate = MKPlacemark(coordinate: destinationCoordinate)
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: startLocation)
        request.destination = MKMapItem(placemark: destinationCoordinate)
        request.transportType = .walking
        request.requestsAlternateRoutes = true
        
        let diraction = MKDirections(request: request)
        diraction.calculate { (response, error) in
            
            if let error = error {
                print(error)
                print("SomeWrongInCreateAlternativeWay")
            }
            guard let response = response else {
                print("Маршрут недоступен")
                return
            }
            
            var minRoute = response.routes[0]
            for route in response.routes {
                minRoute = (route.distance < minRoute.distance) ? route : minRoute
                
            }
            self.maps.addOverlay(minRoute.polyline)
            
        }
    }
    
    func createWay() {
        print("count \(annotationArray.count)")
        for _ in 0...annotationArray.count {
            createDirectionRequest(startCoordinate: annotationArray.first!.coordinate, destinationCoordinate: annotationArray.last!.coordinate)
        }
        
        maps.showAnnotations(annotationArray, animated: true)
    }

}

extension LocationPageViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        renderer.strokeColor = .orange
        return renderer
    }
    
}

