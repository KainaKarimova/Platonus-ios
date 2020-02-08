//
//  SignInContract.swift
//  platonus
//
//  Created by Karina Karimova on 10/17/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import Foundation

protocol SignInView: IndicatableView {
  // TODO: Declare view methods
}

protocol SignInPresentation: class {
  // TODO: Declare presentation methods
  func refresh()
  func didTapLeftButton()
  func didTapSignIn(iin: String, password: String)
}

protocol SignInUseCase: class {
  // TODO: Declare use case methods
}

protocol SignInInteractorOutput: InteractorOutputProtocol {
  // TODO: Declare interactor output methods
}

protocol SignInWireframe: class {
  // TODO: Declare wireframe methods
  func popBack()
  func showGrades()
}
