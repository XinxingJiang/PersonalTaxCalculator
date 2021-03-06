//
//  CalculatorBrain.swift
//  PersonalIncomeTaxCalculator
//
//  Created by Xinxing Jiang on 9/29/15.
//  Copyright © 2015 xjiang. All rights reserved.
//

import Foundation

class CalculatorBrain {
    static let originalDeductStandard = 3500.0
    static var deductStandard = 3500.0
    
    class func getTax(income income: Double, insurance: Double) -> Double? {
        if income < insurance {
            return nil
        }
        let taxableIncome = income - self.deductStandard - insurance
        if taxableIncome < 0 {
            return 0
        }
        switch taxableIncome {
        case 0 ..< 1500:
            return taxableIncome * 0.03
        case 1500 ..< 4500:
            return taxableIncome * 0.1 - 105
        case 4500 ..< 9000:
            return taxableIncome * 0.2 - 555
        case 9000 ..< 35000:
            return taxableIncome * 0.25 - 1005
        case 35000 ..< 55000:
            return taxableIncome * 0.3 - 2755
        case 55000 ..< 80000:
            return taxableIncome * 0.35 - 5505
        default:
            return taxableIncome * 0.45 - 13505
        }
    }
}