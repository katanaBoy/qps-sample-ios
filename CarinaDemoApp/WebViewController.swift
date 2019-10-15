//
//  ViewController.swift
//  CarinaDemoApp
//
//  Copyright (c) 2019 Solvd, Inc. All rights reserved.
//

import UIKit
import WebKit
import ImageSlideshow

class WebViewController: UIViewController, ENSideMenuDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var adSlider: ImageSlideshow!
    
    let localSource = [ImageSource(imageString: "img_banner_carina")!, ImageSource(imageString: "img_banner_mcloud")!, ImageSource(imageString: "img_banner_qpsinfra")!, ImageSource(imageString: "img_banner_zafira")!, ImageSource(imageString: "img_banner_zebrunner")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sideMenuController()?.sideMenu?.delegate = self
        
        webView.load(URLRequest(url: URL(string: "https://www.carina-core.io/")!))
        initAdSlider()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        print("sideMenuShouldOpenSideMenu")
        return true
    }
    
    func sideMenuDidClose() {
        print("sideMenuDidClose")
    }
    
    func sideMenuDidOpen() {
        print("sideMenuDidOpen")
    }
}

