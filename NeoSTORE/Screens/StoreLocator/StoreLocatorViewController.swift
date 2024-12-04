//
//  StoreLocatorViewController.swift
//  NeoSTORE
//
//  Created by Apple on 11/21/24.
//

import UIKit
import MapKit
class StoreLocatorViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    
    @IBOutlet var tableView: UITableView!
    
    let cities = Constants.cityArray
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.navigationController?.navigationBar.isHidden = false
        setUpMapView()
        hideNavigationBackButtton()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1.0, green: 0.149, blue: 0.0, alpha: 1.0)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Store Locator"
    }
    func setUpMapView(){
        for city in cities {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: city.1, longitude: city.2)
            annotation.title = city.0
            annotation.subtitle = city.3
            mapView.addAnnotation(annotation)
        }
        
        
        let initialLocation = CLLocationCoordinate2D(latitude: 20.0, longitude: 75.0) // Rough center of India
        let region = MKCoordinateRegion(center: initialLocation, span: MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 10.0))
        mapView.setRegion(region, animated: true)
        
        
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
    }
}




extension StoreLocatorViewController: MKMapViewDelegate,UITableViewDataSource,UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }
    
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKPointAnnotation {
            let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            annotationView.canShowCallout = true
            let rightButton = UIButton(type: .detailDisclosure)
            annotationView.rightCalloutAccessoryView = rightButton
            
            return annotationView
        }
        return nil
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = cities[indexPath.row].0
        
        cell.detailTextLabel?.text = cities[indexPath.row].3
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let city = cities[indexPath.row]
         
         let selectedCoordinate = CLLocationCoordinate2D(latitude: city.1, longitude: city.2)
         
         let region = MKCoordinateRegion(center: selectedCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
         mapView.setRegion(region, animated: true)
     }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}

