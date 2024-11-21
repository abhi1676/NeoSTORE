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
    
    let cities = [
        ("Mumbai", 19.0760, 72.8777),
        ("Pune", 18.5204, 73.8567),
        ("Sangli", 16.8600, 74.5670),
        ("Delhi", 28.6139, 77.2090),
        ("Navi Mumbai", 19.0330, 73.0297),
        ("Chennai", 13.0827, 80.2707)
    ]
    
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
            return annotationView
        }
        return nil
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) 
        cell.textLabel?.text = cities[indexPath.row].0
        return cell
    }
    
}

