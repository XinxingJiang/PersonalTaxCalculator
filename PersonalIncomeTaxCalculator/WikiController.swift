//
//  WikiController.swift
//  PersonalIncomeTaxCalculator
//
//  Created by Xinxing Jiang on 10/21/15.
//  Copyright © 2015 xjiang. All rights reserved.
//

import UIKit

class WikiController: UIViewController {

    // MARK: - Subviews
    
    var textView: UITextView!
    
    // MARK: - VC life cycles
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        initTextView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func initTextView() {
        textView = UITextView()
        textView.editable = false
        textView.text = "应纳个人所得税税额=应纳税所得额×适用税率-速算扣除数\n 扣除标准3500元/月（2011年9月1日起正式执行）（工资、薪金所得适用）\n应纳税所得额=扣除三险一金后月收入-扣除标准\n2011年9月1日起调整后的7级超额累进税率\n全月应纳税所得额 税率\n 不超过1500元 3%\n 全月应纳税所得额超过1500元至4500元 10%\n 全月应纳税所得额超过4500元至9000元 20%\n 全月应纳税所得额超过9000元至35000元 25%\n 全月应纳税所得额超过35000元至55000元 30%\n 全月应纳税所得额超过55000元至80000元 35%\n 全月应纳税所得额超过80000元 45%"
        self.view.addSubview(textView)
        
        // constraints
        textView.frame = self.view.frame
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

}
