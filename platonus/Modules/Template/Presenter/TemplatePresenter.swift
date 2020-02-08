//
//  TemplatePresenter.swift
//  platonus
//
//  Created by Karina Karimova on 10/16/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import Foundation

class TemplatePresenter: CommonPresenter {
  
  // MARK: Properties
  
  weak var view: TemplateView?
  var router: TemplateWireframe?
  var interactor: TemplateUseCase?
}

extension TemplatePresenter: TemplatePresentation {
  // TODO: implement presentation methods
  func refresh() {
    
  }
  func didTapLeftButton() {
    router?.popBack()
  }
}

extension TemplatePresenter: TemplateInteractorOutput {
  
  // TODO: implement interactor output methods
}
