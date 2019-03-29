//
//  ViewController2.swift
//  SwiftSideMenu
//
//  Created by Evgeny on 01.02.15.
//  Copyright (c) 2015 Evgeny Nazarov. All rights reserved.
//

import UIKit
import AnyChartiOS

class ViewController2: UIViewController, ENSideMenuDelegate {
    
    @IBOutlet weak var anyChartView1: AnyChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sideMenuController()?.sideMenu?.delegate = self
        
        initFruitsChart();
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
