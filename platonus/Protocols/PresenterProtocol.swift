//
//  PresenterProtocol.swift
//  platonus
//
//  Created by Karina Karimova on 10/16/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import Foundation

protocol InteractorOutputProtocol: class {
  @discardableResult
  func handleError(_ error: NSError?) -> Bool
  
  @discardableResult
  func handleErrorMessage(_ error: NSError?) -> Bool
  
}
