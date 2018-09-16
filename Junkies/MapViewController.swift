//
//  MapViewController.swift
//  Junkies
//
//  Created by Manali Rami on 2018-09-12.
//  Copyright © 2018 Manali Rami. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
   
    var locationManager = CLLocationManager()
    var userLocation = CLLocation()
    
    var finalLocation : CLLocation! = nil
    var finalDistance : CLLocationDistance = 0.0
    var finalAddress = " "
    override func viewDidLoad() {
        super.viewDidLoad()
        locateMe()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locateMe() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locations[0] as CLLocation
        
       // locationManager.stopUpdatingLocation()
        
        let coordinates = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        mapView.setRegion(region, animated: true)
        
        findNearest()
    }
    
    func findNearest() {
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = "Subway"
        request.region = mapView.region
        
        let search = MKLocalSearch(request: request)
        
        search.start(completionHandler: {(response, error) in
            
            if error != nil {
            print("An error occurred")
            } else if response!.mapItems.count == 0 {
                print("No matches found")
            } else {
                print("Matches found")
                
                for place in response!.mapItems {
                    
                
                    let placemark = CLLocation(latitude: place.placemark.coordinate.latitude, longitude: place.placemark.coordinate.longitude)
                    
                    if self.finalLocation == nil {
                        self.finalLocation = placemark
                        self.finalDistance = self.userLocation.distance(from: placemark)
                        self.finalAddress = place.placemark.subThoroughfare! + " " + place.placemark.thoroughfare! + " " + place.placemark.locality! + " " + place.placemark.administrativeArea!
                    } else {
                        if self.finalDistance > self.userLocation.distance(from: placemark) {
                            self.finalLocation = placemark
                            self.finalDistance = self.userLocation.distance(from: placemark)
                            self.finalAddress = place.placemark.subThoroughfare! + " " + place.placemark.thoroughfare! + " " + place.placemark.locality! + " " + place.placemark.administrativeArea!
                        }
                    }
                }
                //print(self.finalDistance)
                self.addAnnotation()
                self.updateView()
            }
            })
        
    }
    
    func addAnnotation() {
        let anno = MKPointAnnotation()
        anno.coordinate = self.finalLocation.coordinate
        anno.title = "Subway"
        mapView.addAnnotation(anno)
    }
    
    func updateView() {
        addressLabel.text = finalAddress
        distanceLabel.text = "\(finalDistance) meters"
    }
    
    @IBAction func OpenInMaps(_ sender: Any) {
        let coords = finalLocation.coordinate
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coords))
        mapItem.name = "Subway"
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
