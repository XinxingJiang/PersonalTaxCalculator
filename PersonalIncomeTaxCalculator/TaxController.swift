//
//  TaxController.swift
//  PersonalIncomeTaxCalculator
//
//  Created by Xinxing Jiang on 9/29/15.
//  Copyright © 2015 xjiang. All rights reserved.
//

import UIKit

class TaxController: UIViewController, UITextFieldDelegate {
    
    // MARK: - UIViews
    
    var incomeLabel: UILabel!
    var incomeTextField: UITextField!
    var insuranceLabel: UILabel!
    var insuranceTextField: UITextField!
    var deductStandardTitleLabel: UILabel!
    var deductStandardValueLabel: UILabel!
    var calculateButton: UIButton!
    var resetButton: UIButton!
    var taxTitleLabel: UILabel!
    var taxValueLabel: UILabel!
    var incomeAfterTaxTitleLabel: UILabel!
    var incomeAfterTaxValueLabel: UILabel!
    
    // MARK: - Models
    
    var brain: CalculatorBrain!
    
    // MARK: - VC life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem = UITabBarItem(title: Constants.TabBarItemTitle, image: nil, tag: 1)
        self.view.backgroundColor = UIColor.whiteColor()
        brain = CalculatorBrain()
        initSubviews()
    }
    
    // MARK: - Init subviews
    
    private func initSubviews() {
        initIncomeLabel()
        initIncomeTextField()
        initInsuranceLabel()
        initInsuranceTextField()
        initDeductStandardTitleLabel()
        initDeductStandardValueLabel()
        initCalculateButton()
        initResetButton()
        initTaxTitleLabel()
        initTaxValueLabel()
        initIncomeAfterTaxTitleLabel()
        initIncomeAfterTaxValueLabel()
    }
    
    private func initIncomeLabel() {
        incomeLabel = UILabel()
        incomeLabel.translatesAutoresizingMaskIntoConstraints = false
        incomeLabel.text = Constants.TotalIncome
        incomeLabel.sizeToFit()
        self.view.addSubview(incomeLabel)
        
        let leadingConstraint = NSLayoutConstraint(item: incomeLabel, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .Leading, multiplier: 1, constant: 20)
        let topConstraint = NSLayoutConstraint(item: incomeLabel, attribute: .Top, relatedBy: .Equal, toItem: self.topLayoutGuide, attribute: .Bottom, multiplier: 1, constant: 20)
        self.view.addConstraints([leadingConstraint, topConstraint])
    }
    
    private func initIncomeTextField() {
        incomeTextField = UITextField()
        incomeTextField.translatesAutoresizingMaskIntoConstraints = false
        incomeTextField.placeholder = Constants.RMBYuan
        incomeTextField.borderStyle = .RoundedRect
        incomeTextField.keyboardType = .DecimalPad
        incomeTextField.clearButtonMode = .WhileEditing
        incomeTextField.textAlignment = .Right
        incomeTextField.delegate = self
        self.view.addSubview(incomeTextField)
        
        let leadingConstraint = NSLayoutConstraint(item: incomeTextField, attribute: .Left, relatedBy: .Equal, toItem: incomeLabel, attribute: .Right, multiplier: 1, constant: 20)
        let trailingConstraint = NSLayoutConstraint(item: incomeTextField, attribute: .Trailing, relatedBy: .Equal, toItem: self.view, attribute: .Trailing, multiplier: 1, constant: -20)
        let centerYConstraint = NSLayoutConstraint(item: incomeTextField, attribute: .CenterY, relatedBy: .Equal, toItem: incomeLabel, attribute: .CenterY, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: incomeTextField, attribute: .Height, relatedBy: .Equal, toItem: incomeLabel, attribute: .Height, multiplier: 1, constant: 0)
        self.view.addConstraints([leadingConstraint, trailingConstraint, centerYConstraint, heightConstraint])
    }
    
    private func initInsuranceLabel() {
        insuranceLabel = UILabel()
        insuranceLabel.translatesAutoresizingMaskIntoConstraints = false
        insuranceLabel.text = Constants.Insurance
        self.view.addSubview(insuranceLabel)
        
        let leadingConstraint = NSLayoutConstraint(item: insuranceLabel, attribute: .Leading, relatedBy: .Equal, toItem: incomeLabel, attribute: .Leading, multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: insuranceLabel, attribute: .Trailing, relatedBy: .Equal, toItem: incomeLabel, attribute: .Trailing, multiplier: 1, constant: 0)
        let topConstraint = NSLayoutConstraint(item: insuranceLabel, attribute: .Top, relatedBy: .Equal, toItem: incomeLabel, attribute: .Bottom, multiplier: 1, constant: 20)
        let heightConstraint = NSLayoutConstraint(item: insuranceLabel, attribute: .Height, relatedBy: .Equal, toItem: incomeLabel, attribute: .Height, multiplier: 1, constant: 0)
        self.view.addConstraints([leadingConstraint, trailingConstraint, heightConstraint, topConstraint])
    }
    
    private func initInsuranceTextField() {
        insuranceTextField = UITextField()
        insuranceTextField.translatesAutoresizingMaskIntoConstraints = false
        insuranceTextField.placeholder = Constants.RMBYuan
        insuranceTextField.borderStyle = .RoundedRect
        insuranceTextField.keyboardType = .DecimalPad
        insuranceTextField.clearButtonMode = .WhileEditing
        insuranceTextField.textAlignment = .Right
        insuranceTextField.delegate = self
        self.view.addSubview(insuranceTextField)
        
        let leadingConstraint = NSLayoutConstraint(item: insuranceTextField, attribute: .Left, relatedBy: .Equal, toItem: insuranceLabel, attribute: .Right, multiplier: 1, constant: 20)
        let trailingConstraint = NSLayoutConstraint(item: insuranceTextField, attribute: .Trailing, relatedBy: .Equal, toItem: incomeTextField, attribute: .Trailing, multiplier: 1, constant: 0)
        let centerYConstraint = NSLayoutConstraint(item: insuranceTextField, attribute: .CenterY, relatedBy: .Equal, toItem: insuranceLabel, attribute: .CenterY, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: insuranceTextField, attribute: .Height, relatedBy: .Equal, toItem: incomeLabel, attribute: .Height, multiplier: 1, constant: 0)
        self.view.addConstraints([leadingConstraint, trailingConstraint, centerYConstraint, heightConstraint])
    }
    
    private func initDeductStandardTitleLabel() {
        deductStandardTitleLabel = UILabel()
        deductStandardTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        deductStandardTitleLabel.text = Constants.DeductStandardTitle
        self.view.addSubview(deductStandardTitleLabel)
        
        let leadingConstraint = NSLayoutConstraint(item: deductStandardTitleLabel, attribute: .Leading, relatedBy: .Equal, toItem: insuranceLabel, attribute: .Leading, multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: deductStandardTitleLabel, attribute: .Trailing, relatedBy: .Equal, toItem: insuranceLabel, attribute: .Trailing, multiplier: 1, constant: 0)
        let topConstraint = NSLayoutConstraint(item: deductStandardTitleLabel, attribute: .Top, relatedBy: .Equal, toItem: insuranceLabel, attribute: .Bottom, multiplier: 1, constant: 20)
        let heightConstraint = NSLayoutConstraint(item: deductStandardTitleLabel, attribute: .Height, relatedBy: .Equal, toItem: insuranceLabel, attribute: .Height, multiplier: 1, constant: 0)
        self.view.addConstraints([leadingConstraint, trailingConstraint, heightConstraint, topConstraint])
    }
    
    private func initDeductStandardValueLabel() {
        deductStandardValueLabel = UILabel()
        deductStandardValueLabel.translatesAutoresizingMaskIntoConstraints = false
        deductStandardValueLabel.text = "\(brain.deductStandard)"
        deductStandardValueLabel.textAlignment = .Right
        self.view.addSubview(deductStandardValueLabel)
        
        let leadingConstraint = NSLayoutConstraint(item: deductStandardValueLabel, attribute: .Leading, relatedBy: .Equal, toItem: deductStandardTitleLabel, attribute: .Trailing, multiplier: 1, constant: 20)
        let trailingConstraint = NSLayoutConstraint(item: deductStandardValueLabel, attribute: .Trailing, relatedBy: .Equal, toItem: incomeTextField, attribute: .Trailing, multiplier: 1, constant: 0)
        let centerYConstraint = NSLayoutConstraint(item: deductStandardValueLabel, attribute: .CenterY, relatedBy: .Equal, toItem: deductStandardTitleLabel, attribute: .CenterY, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: deductStandardValueLabel, attribute: .Height, relatedBy: .Equal, toItem: insuranceLabel, attribute: .Height, multiplier: 1, constant: 0)
        self.view.addConstraints([leadingConstraint, trailingConstraint, centerYConstraint, heightConstraint])
    }
    
    private func initCalculateButton() {
        calculateButton = UIButton(type: .System)
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.setTitle(Constants.Calculate, forState: .Normal)
        calculateButton.addTarget(self, action: Selector("calculate"), forControlEvents: UIControlEvents.AllEvents)
        calculateButton.sizeToFit()
        calculateButton.layer.borderWidth = 1.0
        calculateButton.layer.borderColor = UIColor.blueColor().CGColor
        calculateButton.userInteractionEnabled = false
        self.view.addSubview(calculateButton)
        
        let topConstraint = NSLayoutConstraint(item: calculateButton, attribute: .Top, relatedBy: .Equal, toItem: deductStandardTitleLabel, attribute: .Bottom, multiplier: 1, constant: 20)
        let trailingConstraint = NSLayoutConstraint(item: calculateButton, attribute: .Trailing, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: -20)
        let widthConstraint = NSLayoutConstraint(item: calculateButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 100)
        self.view.addConstraints([topConstraint, trailingConstraint, widthConstraint])
    }
    
    private func initResetButton() {
        resetButton = UIButton(type: .System)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.setTitle(Constants.Reset, forState: .Normal)
        resetButton.addTarget(self, action: Selector("reset"), forControlEvents: UIControlEvents.AllEvents)
        resetButton.layer.borderWidth = 1.0
        resetButton.layer.borderColor = UIColor.blueColor().CGColor
        self.view.addSubview(resetButton)
        
        let leadingConstraint = NSLayoutConstraint(item: resetButton, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 20)
        let centerYConstraint = NSLayoutConstraint(item: resetButton, attribute: .CenterY, relatedBy: .Equal, toItem: calculateButton, attribute: .CenterY, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: resetButton, attribute: .Width, relatedBy: .Equal, toItem: calculateButton, attribute: .Width, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: resetButton, attribute: .Height, relatedBy: .Equal, toItem: calculateButton, attribute: .Height, multiplier: 1, constant: 0)
        self.view.addConstraints([leadingConstraint, centerYConstraint, widthConstraint, heightConstraint])a
    }
    
    func calculate() {
        incomeTextField.resignFirstResponder()
        insuranceTextField.resignFirstResponder()

        let income = Double(incomeTextField.text!)!
        let insurance = Double(insuranceTextField.text!)!
        if let tax = brain.getTax(income: income, insurance: insurance) {
            showResult(income: income, tax: tax)
        }
    }
    
    func reset() {
        incomeTextField.resignFirstResponder()
        insuranceTextField.resignFirstResponder()
        
        incomeTextField.text = ""
        insuranceTextField.text = ""
        calculateButton.userInteractionEnabled = false
        
        taxTitleLabel.hidden = true
        taxValueLabel.hidden = true
        incomeAfterTaxTitleLabel.hidden = true
        incomeAfterTaxValueLabel.hidden = true
    }
    
    private func showResult(income income: Double, tax: Double) {
        taxTitleLabel.hidden = false
        taxValueLabel.text = "\(tax)"
        taxValueLabel.hidden = false
        incomeAfterTaxTitleLabel.hidden = false
        incomeAfterTaxValueLabel.text = "\(income - tax)"
        incomeAfterTaxValueLabel.hidden = false
    }
    
    private func initTaxTitleLabel() {
        taxTitleLabel = UILabel()
        taxTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        taxTitleLabel.text = Constants.Tax
        taxTitleLabel.hidden = true
        self.view.addSubview(taxTitleLabel)
        
        let leadingConstraint = NSLayoutConstraint(item: taxTitleLabel, attribute: .Leading, relatedBy: .Equal, toItem: deductStandardTitleLabel, attribute: .Leading, multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: taxTitleLabel, attribute: .Trailing, relatedBy: .Equal, toItem: deductStandardTitleLabel, attribute: .Trailing, multiplier: 1, constant: 0)
        let topConstraint = NSLayoutConstraint(item: taxTitleLabel, attribute: .Top, relatedBy: .Equal, toItem: calculateButton, attribute: .Bottom, multiplier: 1, constant: 20)
        self.view.addConstraints([leadingConstraint, trailingConstraint, topConstraint])
    }
    
    private func initTaxValueLabel() {
        taxValueLabel = UILabel()
        taxValueLabel.translatesAutoresizingMaskIntoConstraints = false
        taxValueLabel.textAlignment = .Right
        taxValueLabel.hidden = true
        self.view.addSubview(taxValueLabel)
        
        let leadingConstraint = NSLayoutConstraint(item: taxValueLabel, attribute: .Leading, relatedBy: .Equal, toItem: deductStandardValueLabel, attribute: .Leading, multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: taxValueLabel, attribute: .Trailing, relatedBy: .Equal, toItem: deductStandardValueLabel, attribute: .Trailing, multiplier: 1, constant: 0)
        let centerYConstraint = NSLayoutConstraint(item: taxValueLabel, attribute: .CenterY, relatedBy: .Equal, toItem: taxTitleLabel, attribute: .CenterY, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: taxValueLabel, attribute: .Height, relatedBy: .Equal, toItem: taxTitleLabel, attribute: .Height, multiplier: 1, constant: 0)
        self.view.addConstraints([leadingConstraint, trailingConstraint, centerYConstraint, heightConstraint])
    }
    
    private func initIncomeAfterTaxTitleLabel() {
        incomeAfterTaxTitleLabel = UILabel()
        incomeAfterTaxTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        incomeAfterTaxTitleLabel.text = Constants.IncomeAfterTax
        incomeAfterTaxTitleLabel.hidden = true
        self.view.addSubview(incomeAfterTaxTitleLabel)
        
        let leadingConstraint = NSLayoutConstraint(item: incomeAfterTaxTitleLabel, attribute: .Leading, relatedBy: .Equal, toItem: taxTitleLabel, attribute: .Leading, multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: incomeAfterTaxTitleLabel, attribute: .Trailing, relatedBy: .Equal, toItem: taxTitleLabel, attribute: .Trailing, multiplier: 1, constant: 0)
        let topConstraint = NSLayoutConstraint(item: incomeAfterTaxTitleLabel, attribute: .Top, relatedBy: .Equal, toItem: taxTitleLabel, attribute: .Bottom, multiplier: 1, constant: 20)
        self.view.addConstraints([leadingConstraint, trailingConstraint, topConstraint])
    }
    
    private func initIncomeAfterTaxValueLabel() {
        incomeAfterTaxValueLabel = UILabel()
        incomeAfterTaxValueLabel.translatesAutoresizingMaskIntoConstraints = false
        incomeAfterTaxValueLabel.textAlignment = .Right
        incomeAfterTaxValueLabel.hidden = true
        self.view.addSubview(incomeAfterTaxValueLabel)
        
        let leadingConstraint = NSLayoutConstraint(item: incomeAfterTaxValueLabel, attribute: .Leading, relatedBy: .Equal, toItem: taxValueLabel, attribute: .Leading, multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: incomeAfterTaxValueLabel, attribute: .Trailing, relatedBy: .Equal, toItem: taxValueLabel, attribute: .Trailing, multiplier: 1, constant: 0)
        let centerYConstraint = NSLayoutConstraint(item: incomeAfterTaxValueLabel, attribute: .CenterY, relatedBy: .Equal, toItem: incomeAfterTaxTitleLabel, attribute: .CenterY, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: incomeAfterTaxValueLabel, attribute: .Height, relatedBy: .Equal, toItem: incomeAfterTaxTitleLabel, attribute: .Height, multiplier: 1, constant: 0)
        self.view.addConstraints([leadingConstraint, trailingConstraint, centerYConstraint, heightConstraint])
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let textAfterEdit = NSString(string: textField.text ?? "").stringByReplacingCharactersInRange(range, withString: string)
        if textAfterEdit.isEmpty {
            calculateButton.userInteractionEnabled = false
        } else {
            if textField == incomeTextField {
                if let text = insuranceTextField.text {
                    calculateButton.userInteractionEnabled = !text.isEmpty
                }
            }
            if textField == insuranceTextField {
                if let text = incomeTextField.text {
                    calculateButton.userInteractionEnabled = !text.isEmpty
                }
            }
        }
        return true
    }
    
    // MARK: - Constants
    
    struct Constants {
        static let TabBarItemTitle = "Tax"
        static let TotalIncome = "收入总额"
        static let Insurance = "三险一金"
        static let DeductStandardTitle = "起征额"
        static let RMBYuan = "元"
        static let Calculate = "计算"
        static let Reset = "重置"
        static let Tax = "应缴税额"
        static let IncomeAfterTax = "税后收入"
    }
}
