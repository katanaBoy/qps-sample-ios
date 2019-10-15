//
//  GoogleMapViewController.swift
//  CarinaDemoApp
//
//  Copyright (c) 2019 Solvd, Inc. All rights reserved.
//

import UIKit
import GoogleMaps
import ImageSlideshow

class GoogleMapViewController: UIViewController, ENSideMenuDelegate {
    
    @IBOutlet weak var adSlider: ImageSlideshow!
    @IBOutlet weak var mapContainer: GMSMapView!
    
    let localSource = [ImageSource(imageString: "img_banner_carina")!, ImageSource(imageString: "img_banner_mcloud")!, ImageSource(imageString: "img_banner_qpsinfra")!, ImageSource(imageString: "img_banner_zafira")!, ImageSource(imageString: "img_banner_zebrunner")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sideMenuController()?.sideMenu?.delegate = self
        
        initAdSlider()
        loadMapView()
    }
    
    func loadMapView() {
        let camera = GMSCameraPosition.camera(withLatitude: 53.893009, longitude: 27.567444, zoom: 10.5)
        mapContainer.camera = camera
//        let mapView = GMSMapView.map(withFrame: mapContainer.bounds, camera: camera)
        mapContainer.settings.compassButton = true
        mapContainer.settings.zoomGestures = true
        mapContainer.isBuildingsEnabled = true
        
//        mapView.center = mapContainer.center
//        mapContainer.addSubview(mapView)
//        view.addSubview(mapView)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 53.893009, longitude: 27.567444)
        marker.title = "Minsk"
        marker.snippet = "Marker in Minsk"
        marker.map = mapContainer
    }
    
    func initAdSlider() {
        adSlider.slideshowInterval = 5.0
        adSlider.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        adSlider.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        pageControl.pageIndicatorTintColor = UIColor.black
        adSlider.pageIndicator = pageControl
        
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        adSlider.activityIndicator = DefaultActivityIndicator()
        //        adSlider.delegate = self
        
        adSlider.setImageInputs(localSource)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(UIElemetsViewController.didTap))
        adSlider.addGestureRecognizer(recognizer)
    }
    
    @objc func didTap() {
        let fullScreenController = adSlider.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
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
