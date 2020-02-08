//
//  GradesContract.swift
//  platonus
//
//  Created by Karina Karimova on 10/19/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import Foundation

protocol GradesView: IndicatableView {
  // TODO: Declare view methods
}

protocol GradesPresentation: class {
  // TODO: Declare presentation methods
  func refresh()
  func didTapLeftButton()
}

protocol GradesUseCase: class {
  // TODO: Declare use case methods
}

protocol GradesInteractorOutput: InteractorOutputProtocol {
  // TODO: Declare interactor output methods
}

protocol GradesWireframe: class {
  // TODO: Declare wireframe methods
  func popBack()
}
