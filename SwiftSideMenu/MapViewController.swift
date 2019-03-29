//
//  MapViewController.swift
//  SwiftSideMenu
//
//  Created by Artsiom Seliuzhitsky on 3/29/19.
//  Copyright © 2019 Evgeny Nazarov. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class MapViewController: UIViewController, ENSideMenuDelegate {
    
    // You don't need to modify the default init(nibName:bundle:) method.
    
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 53.893009, longitude: 27.567444, zoom: 10.5)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.settings.compassButton = true
        mapView.settings.zoomGestures = true
        mapView.isBuildingsEnabled = true
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 53.893009, longitude: 27.567444)
        marker.title = "Minsk"
        marker.snippet = "Marker in Minsk"
        marker.map = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sideMenuController()?.sideMenu?.delegate = self
    }
    
    @IBAction func toggleSideMenuBtn(_ sender: UIBarButtonItem) {
        toggleSideMenuView()
    }
    
    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {
        print("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        print("sideMenuWillClose")
    }
    
    func sideMenuDidClose() {
        print("sideMenuDidClose")
    }
    
    func sideMenuDidOpen() {
        print("sideMenuDidOpen")
    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        print("sideMenuShouldOpenSideMenu")
        return true
    }
}
