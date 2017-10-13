//
//  MapViewController.swift
//  TroutTracker
//
//  Created by Kaley Groskreutz on 8/5/17.
//  Copyright © 2017 BigNerdRanch. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad () {
        let annotation = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(latitude: 41, longitude: 41)
        annotation.coordinate = centerCoordinate
        annotation.title = "Title"
        mapView.addAnnotation(annotation)
    }
}
