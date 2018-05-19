//
//  MapPositionVC.swift
//  sayis
//
//  Created by ahmedxiio on 4/4/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import GooglePlacePicker


class MapPositionVC: UIViewController , GMSPlacePickerViewControllerDelegate {
    //Mark : propierities
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var currentPositionTitle: UIButton!
    @IBOutlet weak var destinationTitle: UIButton!
    
    
    var placesClient: GMSPlacesClient!
    let PlacePickerViewController = GMSPlacePickerViewController()

//    var place: GMSPlace? = nil
    var name: String!
    
    //Mark:  LocationManager instance
    var locationManager = CLLocationManager()
    var placePickerViewController:GMSPlacePickerViewController?
    var GMSPlace:GMSPlace?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GoogleMapSetup()
        locationManager.requestAlwaysAuthorization()
        placesClient = GMSPlacesClient.shared()
    }
    
    //Mark: Actions
    @IBAction func dismissMapPositionVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    func placePicker(_ viewController: GMSPlacePickerViewController, didPick place: GMSPlace) {
        
        viewController.dismiss(animated: true, completion: nil)
        self.name = "\(place.name)"
        print("Place name \(place.name)")
        print("Place address \(String(describing: place.formattedAddress))")
        print("Place attributions \(String(describing: place.attributions))")
    }
    
    func placePickerDidCancel(_ viewController: GMSPlacePickerViewController) {
        // Dismiss the place picker, as it cannot dismiss itself.
        self.dismiss(animated: true, completion: nil)
        print("No place selected")
    }
    @IBAction func currentPositionButtonTapped(_ sender: Any) {
        placePickerSetup()
        self.currentPositionTitle.setTitle(name, for: .normal)
    }
    
    @IBAction func destinationButtonTapped(_ sender: Any) {
        placePickerSetup()
        self.destinationTitle.setTitle(name, for: .normal)
  }
    
    @IBAction func mapPositionSelected(_ sender: SayisButton) {
        
        self.dismiss(animated: true, completion: nil)

    }
    //Google Maps setup
    func GoogleMapSetup() {
        let camera = GMSCameraPosition.camera(withLatitude: 24.713562, longitude: 46.675286, zoom: 15)
        mapView.camera = camera
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 24.713562, longitude: 46.675286)
        marker.title = "Ryad"
        marker.snippet = "Sudi Arabia"
        marker.map = mapView
    }
    func placePickerSetup() {
        let center = CLLocationCoordinate2D(latitude: 24.713562, longitude: 46.675286)
        let northEast = CLLocationCoordinate2D(latitude: center.latitude + 0.001,longitude: center.longitude + 0.001)
        let southWest = CLLocationCoordinate2D(latitude: center.latitude - 0.001,longitude: center.longitude - 0.001)
        let viewport = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
        let config = GMSPlacePickerConfig(viewport: viewport)
        let placePicker = GMSPlacePickerViewController(config: config)
        placePicker.delegate=self
        
        present(placePicker, animated: true, completion: nil)
      }
    
}


