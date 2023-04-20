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
    
    var testArrayAnnotation = ["Kharkiv, PUTYLIVSKYI LANE 1", "Kharkiv, DANYLEVSKOHO STREET"]
    
    var annotationArray = [MKPointAnnotation]()
    //[0x281d311c0, 0x281d34980]
    

    override func viewDidLoad() {
        super.viewDidLoad()
                

            setupPlaceMarkStart()
            setupPlaceMarkEnd()
            createWay()
            
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
    
    func setupPlaceMarkStart() {
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString("Харків, Проспект Науки 1") { [self] (placemarks, error) in
            if let _ = error {
                print("some wrong")
                return
            }
            
            guard let placemarks = placemarks else {return}
            let placemark = placemarks.first
            
            let annotationStart = MKPointAnnotation()
            annotationStart.title = "Харьков, Путиловский переулок"
            guard let placemarkLocationStart = placemark?.location else {return}
            annotationStart.coordinate = placemarkLocationStart.coordinate
            
            annotationArray.append(annotationStart)
            print("ETO KOT: \(annotationStart)")
            
            maps.showAnnotations(annotationArray, animated: true)
            
            
        }
    }
    
    func setupPlaceMarkEnd() {
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString("Харків, Проспект Науки 1") { [self] (placemarks, error) in
            if let _ = error {
                print("some wrong")
                return
            }
            
            guard let placemarks = placemarks else {return}
            let placemark = placemarks.first
            
            let annotationEnd = MKPointAnnotation()
            annotationEnd.title = "Харків, Шатілова дача"
            guard let placemarkLocationEnd = placemark?.location else {return}
            annotationEnd.coordinate = placemarkLocationEnd.coordinate
            
            annotationArray.append(annotationEnd)
            print("ETO KOT: \(annotationEnd)")

            
            
            maps.showAnnotations(annotationArray, animated: true)
            
            createWay()
        }
    }
    
    private func createDirectionRequest(startCoordinate: CLLocationCoordinate2D, destinationCoordinate: CLLocationCoordinate2D) {
        
        let startLocation = MKPlacemark(coordinate: startCoordinate)
        let destinationCoordinate = MKPlacemark(coordinate: destinationCoordinate)
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: startLocation)
        request.destination = MKMapItem(placemark: destinationCoordinate)
        request.transportType = .automobile
        request.requestsAlternateRoutes = true
        
        let deraction = MKDirections(request: request)
        deraction.calculate { (response, error) in
            
            if let _ = error {
                print("SomeWrongInCreateAlternativeWay")
            }
            guard let response = response else {
                
                print("some wrong")
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
        for index in 0...annotationArray.count {
            createDirectionRequest(startCoordinate: annotationArray[index].coordinate, destinationCoordinate: annotationArray[index + 1].coordinate)
        }
    }

}

extension LocationPageViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        renderer.strokeColor = .red
        return renderer
    }
    
}
