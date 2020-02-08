//
//  SignInRouter.swift
//  platonus
//
//  Created by Karina Karimova on 10/17/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import Foundation
import UIKit

class SignInRouter {
  
  // MARK: Properties
  
  weak var view: UIViewController?
  
  // MARK: Static methods
  
  static func setupModule() -> SignInViewController {
    let viewController = SignInViewController()
    let presenter = SignInPresenter()
    let router = SignInRouter()
    let interactor = SignInInteractor()
    
    viewController.presenter =  presenter
    
    presenter.view = viewController
    presenter.indicatableView = viewController
    presenter.router = router
    presenter.interactor = interactor
    
    router.view = viewController
    
    interactor.output = presenter
    
    return viewController
  }
}

extension SignInRouter: SignInWireframe {
  // TODO: Implement wireframe methods
  func popBack() {
    self.view?.navigationController?.popViewController(animated: true)
  }
  
  func showGrades() {
    let vc = GradesViewController()
    view?.present(vc, animated: true, completion: nil)
  }
}
