//
//  GradesRouter.swift
//  platonus
//
//  Created by Karina Karimova on 10/19/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import Foundation
import UIKit

class GradesRouter {
  
  // MARK: Properties
  
  weak var view: UIViewController?
  
  // MARK: Static methods
  
  static func setupModule() -> GradesViewController {
    let viewController = GradesViewController()
    let presenter = GradesPresenter()
    let router = GradesRouter()
    let interactor = GradesInteractor()
    
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

extension GradesRouter: GradesWireframe {
  // TODO: Implement wireframe methods
  func popBack() {
    self.view?.navigationController?.popViewController(animated: true)
  }
}
