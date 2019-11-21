//
//  UIElementsViewController.swift
//  CarinaDemoApp
//
//  Copyright (c) 2019 Solvd, Inc. All rights reserved.
//

import UIKit
import ImageSlideshow

class UIElemetsViewController: UIViewController, ENSideMenuDelegate {
    
    @IBOutlet weak var adSlider: ImageSlideshow!
  @IBOutlet weak var textTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var copyLabel: UILabel!
  @IBOutlet weak var genderSegmentControl: UISegmentedControl!
  
    let localSource = [ImageSource(imageString: "img_banner_carina")!, ImageSource(imageString: "img_banner_mcloud")!, ImageSource(imageString: "img_banner_qpsinfra")!, ImageSource(imageString: "img_banner_zafira")!, ImageSource(imageString: "img_banner_zebrunner")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sideMenuController()?.sideMenu?.delegate = self
        
        initAdSlider()
      setupLocalization()
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
  
  func setupLocalization(){
    textTextField.placeholder = "text".localized
    emailTextField.placeholder = "email".localized
    copyLabel.text = "copy".localized
    genderSegmentControl.setTitle("male".localized, forSegmentAt: 0)
    genderSegmentControl.setTitle("female".localized, forSegmentAt: 1)
    genderSegmentControl.setTitle("other".localized, forSegmentAt: 2)
  }
  
    
    @objc func didTap() {
        let fullScreenController = adSlider.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
    
//    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
//        print("current page:", page)
//    }
    
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
