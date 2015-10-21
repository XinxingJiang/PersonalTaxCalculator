//
//  SettingController.swift
//  PersonalIncomeTaxCalculator
//
//  Created by Xinxing Jiang on 9/29/15.
//  Copyright © 2015 xjiang. All rights reserved.
//

import UIKit

class SettingController: UIViewController, UITextFieldDelegate {

    // MARK: - UIViews
    
    var deductStandardLabel: UILabel!
    var deductStandardTextField: UITextField!
    var confirmButton: UIButton!
    var resetButton: UIButton!
    
    // MARK: - Models
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        initSubviews()
    }
    
    private func initSubviews() {
        initDeductStandardLabel()
        initDeductStandardTextField()
        initConfirmButton()
        initResetButton()
    }
    
    private func initDeductStandardLabel() {
        deductStandardLabel = UILabel()
        deductStandardLabel.text = Constants.DeductStandard
        deductStandardLabel.sizeToFit()
        self.view.addSubview(deductStandardLabel)

        deductStandardLabel.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = NSLayoutConstraint(item: deductStandardLabel, attribute: .Top, relatedBy: .Equal, toItem: self.topLayoutGuide, attribute: .Bottom, multiplier: 1, constant: 20)
        let leadingConstraint = NSLayoutConstraint(item: deductStandardLabel, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .Leading, multiplier: 1, constant: 20)
        let widthConstraint = NSLayoutConstraint(item: deductStandardLabel, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 100)
        self.view.addConstraints([topConstraint, leadingConstraint, widthConstraint])
    }
    
    private func initDeductStandardTextField() {
        deductStandardTextField = UITextField()
        deductStandardTextField.delegate = self
        deductStandardTextField.textAlignment = .Right
        deductStandardTextField.placeholder = Constants.RMBYuan
        deductStandardTextField.clearButtonMode = .WhileEditing
        deductStandardTextField.keyboardType = .DecimalPad
        deductStandardTextField.borderStyle = .RoundedRect
        self.view.addSubview(deductStandardTextField)
        
        deductStandardTextField.translatesAutoresizingMaskIntoConstraints = false
        let leadingConstraint = NSLayoutConstraint(item: deductStandardTextField, attribute: .Leading, relatedBy: .Equal, toItem: deductStandardLabel, attribute: .Trailing, multiplier: 1, constant: 20)
        let trailingConstraint = NSLayoutConstraint(item: deductStandardTextField, attribute: .Trailing, relatedBy: .Equal, toItem: self.view, attribute: .Trailing, multiplier: 1, constant: -20)
        let centerYConstraint = NSLayoutConstraint(item: deductStandardTextField, attribute: .CenterY, relatedBy: .Equal, toItem: deductStandardLabel, attribute: .CenterY, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: deductStandardTextField, attribute: .Height, relatedBy: .Equal, toItem: deductStandardLabel, attribute: .Height, multiplier: 1, constant: 0)
        self.view.addConstraints([leadingConstraint, trailingConstraint, centerYConstraint, heightConstraint])
    }
    
    private func initConfirmButton() {
        confirmButton = UIButton(type: .System)
        confirmButton.setTitle(Constants.Confirm, forState: .Normal)
        confirmButton.layer.borderWidth = 1.0
        changeConfirmButtonClickable(false)
        confirmButton.sizeToFit()
        confirmButton.addTarget(self, action: Selector("confirm"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(confirmButton)
        
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = NSLayoutConstraint(item: confirmButton, attribute: .Top, relatedBy: .Equal, toItem: deductStandardLabel, attribute: .Bottom, multiplier: 1, constant: 20)
        let trailingConstraint = NSLayoutConstraint(item: confirmButton, attribute: .Trailing, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: -20)
        let widthConstraint = NSLayoutConstraint(item: confirmButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 100)
        self.view.addConstraints([topConstraint, trailingConstraint, widthConstraint])
    }
    
    private func initResetButton() {
        resetButton = UIButton(type: .System)
        resetButton.setTitle(Constants.Reset, forState: .Normal)
        resetButton.layer.borderWidth = 1.0
        resetButton.layer.borderColor = UIColor.blueColor().CGColor
        resetButton.addTarget(self, action: Selector("reset"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(resetButton)
        
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        let leadingCon = NSLayoutConstraint(item: resetButton, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 20)
        let widthCon = NSLayoutConstraint(item: resetButton, attribute: .Width, relatedBy: .Equal, toItem: confirmButton, attribute: .Width, multiplier: 1, constant: 0)
        let heightCon = NSLayoutConstraint(item: resetButton, attribute: .Height, relatedBy: .Equal, toItem: confirmButton, attribute: .Height, multiplier: 1, constant: 0)
        let centerYCon = NSLayoutConstraint(item: resetButton, attribute: .CenterY, relatedBy: .Equal, toItem: confirmButton, attribute: .CenterY, multiplier: 1, constant: 0)
        self.view.addConstraints([leadingCon, widthCon, heightCon, centerYCon])
    }
    
    func confirm() {
        changeConfirmButtonClickable(false)
        deductStandardTextField.resignFirstResponder()
        let deductStandard = Double(deductStandardTextField.text!)!
        CalculatorBrain.deductStandard = deductStandard
        deductStandardTextField.text = ""
        (self.parentViewController as! UITabBarController).selectedIndex = 0
    }
    
    func reset() {
        deductStandardTextField.resignFirstResponder()
        deductStandardTextField.text = ""
        changeConfirmButtonClickable(false)
        CalculatorBrain.deductStandard = CalculatorBrain.originalDeductStandard
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let textAfterEdit = NSString(string: textField.text ?? "").stringByReplacingCharactersInRange(range, withString: string)
        changeConfirmButtonClickable(!textAfterEdit.isEmpty)
        return true
    }
    
    private func changeConfirmButtonClickable(clickable: Bool) {
        confirmButton.userInteractionEnabled = clickable
        if clickable {
            confirmButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
            confirmButton.layer.borderColor = UIColor.blueColor().CGColor
        } else {
            confirmButton.setTitleColor(UIColor.grayColor(), forState: .Normal)
            confirmButton.layer.borderColor = UIColor.grayColor().CGColor
        }
    }

    // MARK: - Constants
    
    struct Constants {
        static let TabBarItemTitle = "设置"
        static let DeductStandard = "起征额"
        static let RMBYuan = "元"
        static let Confirm = "确认"
        static let Reset = "重置"
    }
}
