//
//  ChartViewController.swift
//  CarinaDemoApp
//
//  Copyright (c) 2019 Solvd, Inc. All rights reserved.
//

import UIKit
import AnyChartiOS
import ImageSlideshow

class ChartViewController: UIViewController, ENSideMenuDelegate {
    
    @IBOutlet weak var anyChartView1: AnyChartView!
    @IBOutlet weak var adSlider: ImageSlideshow!
    
    let localSource = [ImageSource(imageString: "img_banner_carina")!, ImageSource(imageString: "img_banner_mcloud")!, ImageSource(imageString: "img_banner_qpsinfra")!, ImageSource(imageString: "img_banner_zafira")!, ImageSource(imageString: "img_banner_zebrunner")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sideMenuController()?.sideMenu?.delegate = self
        
        initFruitsChart()
        initAdSlider()
    }
    
    @objc func hell(event: NSDictionary) {
        print("hell")
        print(event["x"]!)
        print(event["value"]!)
    }
    
    func initFruitsChart() {
        
        let chart = AnyChart.pie()
        chart.addTarget(target: self, action: #selector(hell), fields: ["x", "value"])
        
        let data: Array<DataEntry> = [
            ValueDataEntry(x: "Apples", value: 6371664),
            ValueDataEntry(x: "Pears", value: 789622),
            ValueDataEntry(x: "Bananas", value: 7216301),
            ValueDataEntry(x: "Grapes", value: 1486621),
            ValueDataEntry(x: "Oranges", value: 1200000)
        ]
        chart.data(data: data)
        chart.title(settings: "Fruits imported in 2015 (in kg)")
        chart.labels().position(position: "outside")
        chart.legend().title().enabled(enabled: true)
        chart.legend().title()
            .text(text: "Retail channels")
            .padding(value1: 0, value2: 0, value3: 10, value4: 0)
        chart.legend()
            .position(position: "center-bottom")
            .itemsLayout(layout: anychart.enums.LegendLayout.HORIZONTAL)
            .align(align: anychart.enums.Align.CENTER)
        
        anyChartView1.setChart(chart: chart)
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
