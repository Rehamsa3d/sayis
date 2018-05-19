//
//  homeVC.swift
//  sayis
//
//  Created by ahmedxiio on 3/27/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//
 // self.messageToDisplay(messageToDisplay: "\(String(describing: UserUtil.loadUser()?.id))")


import UIKit
import SideMenu
import GooglePlaces
import GoogleMaps
import GooglePlacePicker


class HomeVC: UIViewController  {
    //Mark: Properities
    var pageType: String?
    @IBOutlet weak var mapView: GMSMapView!

    //Mark:  LocationManager instance
    var locationManager = CLLocationManager()
  
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        GoogleMapSetup()
    }
    @IBAction func sideMenuTaped(_ sender: Any) {
    }
    
    @IBAction func searchButtonTaped(_ sender: UIButton) {
        presentToMapPositionVC()
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
        
        // Request For LocationManager Authorization
        locationManager.requestAlwaysAuthorization()
    }
    func presentToMapPositionVC()  {
        let mapPositionVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MapPositionVC") as! MapPositionVC
        self.present(mapPositionVC, animated: true, completion: nil)

    }
 
}





