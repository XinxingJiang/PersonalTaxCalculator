//
//  TabBarController.swift
//  PersonalIncomeTaxCalculator
//
//  Created by Xinxing Jiang on 10/21/15.
//  Copyright © 2015 xjiang. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // setup tabs
        let taxController = TaxController()
        taxController.tabBarItem = UITabBarItem(title: Constants.TaxControllerTabBarItemTitle, image: nil, tag: 1)
        let settingController = SettingController()
        settingController.tabBarItem = UITabBarItem(title: Constants.SettingControllerTabBarItemTitle, image: nil, tag: 2)
        let wikiController = WikiController()
        wikiController.tabBarItem = UITabBarItem(title: Constants.WikiControllerTabBarItemTitle, image: nil, tag: 2)
        
        self.viewControllers = [taxController, settingController, wikiController]

        // default to first tab
        self.selectedIndex = 0
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    struct Constants {
        static let TaxControllerTabBarItemTitle = "计算"
        static let SettingControllerTabBarItemTitle = "设置"
        static let WikiControllerTabBarItemTitle = "维基"
    }
}
