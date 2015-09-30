//
//  SettingController.swift
//  PersonalIncomeTaxCalculator
//
//  Created by Xinxing Jiang on 9/29/15.
//  Copyright © 2015 xjiang. All rights reserved.
//

import UIKit

class SettingController: UIViewController {

    // MARK: - UIViews
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem = UITabBarItem(title: Constants.TabBarItemTitle, image: nil, tag: 2)
        self.view.backgroundColor = UIColor.yellowColor()
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

    // MARK: - Constants
    
    struct Constants {
        static let TabBarItemTitle = "Setting"
    }
}
