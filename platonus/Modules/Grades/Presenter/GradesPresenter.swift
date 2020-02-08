//
//  GradesPresenter.swift
//  platonus
//
//  Created by Karina Karimova on 10/19/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import Foundation

class GradesPresenter: CommonPresenter {
  
  // MARK: Properties
  
  weak var view: GradesView?
  var router: GradesWireframe?
  var interactor: GradesUseCase?
}

extension GradesPresenter: GradesPresentation {
  // TODO: implement presentation methods
  func refresh() {
    
  }
  func didTapLeftButton() {
    router?.popBack()
  }
}

extension GradesPresenter: GradesInteractorOutput {
  
  // TODO: implement interactor output methods
}
