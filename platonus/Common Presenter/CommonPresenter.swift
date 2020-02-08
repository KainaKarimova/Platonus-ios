//
//  CommonPresenter.swift
//  platonus
//
//  Created by Karina Karimova on 10/16/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import Foundation

class CommonPresenter {
  weak var indicatableView: IndicatableView?
  
  func handleError(_ error: NSError?) -> Bool {
    if let error = error {
      if error.code == NSURLErrorTimedOut || error.code == -1009 {
        if indicatableView is NetworkHandlingView {
          (indicatableView as! NetworkHandlingView).showNoNetwork()
        }
        indicatableView?.showNetworkError()
      }
      else if error.code == NSURLErrorCancelled {
        // don't show anything if it's cancelled
      }
      else if error.code == 0 {
        indicatableView?.showError(with: error.domain)
      }
      else {
        //        indicatableView?.showError(with: error.localizedDescription)
        indicatableView?.show(error.localizedDescription)
      }
      
      return true
    } else {
      if indicatableView is NetworkHandlingView {
        (indicatableView as! NetworkHandlingView).hideNoNetwork()
      }
      return false
    }
  }
  
  func handleErrorMessage(_ error: NSError?) -> Bool {
    if let error = error {
      if error.code == NSURLErrorTimedOut || error.code == -1009 {
        if indicatableView is NetworkHandlingView {
          (indicatableView as! NetworkHandlingView).showNoNetwork()
        }
        indicatableView?.showNetworkError()
      }
      else if error.code == NSURLErrorCancelled {
        // don't show anything if it's cancelled
      }
      else if error.code == 0 {
        indicatableView?.show(error.domain)
      }
      else {
        indicatableView?.show(error.localizedDescription)
      }
      
      return true
    } else {
      if indicatableView is NetworkHandlingView {
        (indicatableView as! NetworkHandlingView).hideNoNetwork()
      }
      return false
    }
  }
  
}

