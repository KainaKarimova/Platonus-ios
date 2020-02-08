//
//  RootRouter.swift
//  platonus
//
//  Created by Karina Karimova on 10/16/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import Foundation
import UIKit
import SideMenuSwift

class RootRouter: RootWireFrame {
  
  func presentMainTabScreen(in window: UIWindow) {
    window.makeKeyAndVisible()
    
  }
  
  func presentLoginScreen(in window: UIWindow, isFirstLaunch: Bool) {
    window.makeKeyAndVisible()
    let vc = SignInRouter.setupModule()
//    vc.isFirstLaunch = isFirstLaunch
    let navVC = UINavigationController(rootViewController: vc)
    navVC.isNavigationBarHidden = true
    if var topController = UIApplication.shared.keyWindow?.rootViewController {
      while let presentedViewController = topController.presentedViewController {
        topController = presentedViewController
      }
      navVC.modalTransitionStyle = .flipHorizontal
      topController.present(navVC, animated: !isFirstLaunch)
    }
  }
  
  func presentRegistrationScreen(in window: UIWindow) {
    window.makeKeyAndVisible()
    //    window.rootViewController = RegistrationRouter.setupModule()
  }
}
