//
//  FirstViewController.swift
//  meMap
//
//  Created by Linda MUCASSI on 2018/10/10.
//  Copyright © 2018 Linda MUCASSI. All rights reserved.
//  pk.eyJ1IjoibGluZGFzbXVjYXNzaSIsImEiOiJjam41dmIzaXMzd2t0M3FvOHZyZ3BzYmR3In0.YtleDwtVwX_Nt4PQk2IW9w

import UIKit
import MapKit
import CoreLocation

class FirstViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setUpLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationServices() {
        if (CLLocationManager.locationServicesEnabled()) {
            // setup location manager
            setUpLocationManager()
        } else {
            // show alert to enable location first
        }
    }

    func checkLocationAuthorization(){
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            break
        case .denied:
            break
        case .notDetermined:
            break
        case .restricted:
            break
        case .authorizedAlways:
            break
        }
    }
}

extension FirstViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManagerDelegate, didUpdateLocation location: [CLLocation]) {
        //i'll be back
    }
    
    func locationManager(_ manager: CLLocationManagerDelegate, didChangeAuthorization status: CLAuthorizationStatus) {
        //i'll be back
    }
}
