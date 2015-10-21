//
//  UINavigationControllerExtension.swift
//
//  Created by Xinxing Jiang on 10/5/15.
//  Copyright © 2015 iosjjj. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    var hideNavigationBar: Bool! {
        get {
            return self.navigationController?.navigationBarHidden
        }
        set {
            self.navigationController?.navigationBarHidden = newValue
        }
    }
}