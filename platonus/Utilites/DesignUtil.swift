//
//  DesignUtil.swift
//  platonus
//
//  Created by Karina Karimova on 10/16/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import Foundation
import UIKit

class DesignUtil {
  
  static func configureToAppAppearance() {
    UIApplication.shared.statusBarStyle = .lightContent
    UINavigationBar.appearance().barTintColor = .white
  }
  
  static func platonusThemeBlue() -> UIColor {
    return UIColor(red: 0, green: 0.69, blue: 0.85, alpha: 1)
  }
  
  
}
