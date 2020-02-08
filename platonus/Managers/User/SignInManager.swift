//
//  SignInManager.swift
//  platonus
//
//  Created by Karina Karimova on 10/18/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import Foundation
import UIKit
import WebKit

protocol SignInManagerDelegate: class {
  func success()
  func fail()
}

enum SignInLoadingState {
  case loadingLoginPage
  case loadingHomePage
}

class SignInManager: UIViewController, WKNavigationDelegate {
  
  weak var delegate: SignInManagerDelegate?
  
  fileprivate let webView = WKWebView()
  
  fileprivate var loadingState = SignInLoadingState.loadingLoginPage
  
  fileprivate var iin: String!
  fileprivate var pass: String!
  
  public func signIn(iin: String, pass: String) {
    print("Loading...")
    self.iin = iin
    self.pass = pass
    webView.navigationDelegate = self
    loadLoginPage()
  }
  
  fileprivate func loadLoginPage() {
    let platonusUrl = URL(string: "https://edu.enu.kz/")!
    let request = URLRequest(url: platonusUrl)
    loadingState = .loadingLoginPage
    webView.load(request)
    Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (timer) in
      if self.loadingState == .loadingLoginPage {
        self.loadLoginPage()
        timer.invalidate()
      }
    }
  }
  
  fileprivate func loadHomePage() {
    loadingState = .loadingHomePage
    
    webView.evaluateJavaScript("change_lang_paltonus('ru')", completionHandler: nil)
    
    
    guard let iin = Int(self.iin) else {
      print("Error setting iin")
      return
    }
    webView.evaluateJavaScript("document.getElementById('iin_input').value='\(iin)'") { (value, error) in
      if !self.handleError(error: error) {
        return
      }
    }
    //pass_input
    guard let pass = self.pass else {
      print("Error setting pass")
      return
    }
    webView.evaluateJavaScript("document.getElementById('pass_input').value='\(pass)'") { (value, error) in
      if !self.handleError(error: error) {
        return
      }
    }
    //Form1
    webView.evaluateJavaScript("document.getElementById('Form1').submit();") { (response, error) in
      if !self.handleError(error: error) {
        return
      }
    }
  }
  
  fileprivate func checkIfLoggedIn() {
    webView.evaluateJavaScript("document.body.id") { (response, error) in
      if !self.handleError(error: error) {
        return
      }
      
      if let ans = response as? String {
        print(ans)
        if ans != "error-page" {
          self.loginSuccess()
        } else {
          self.loginFail()
        }
      } else {
        print("Error")
      }
      
    }
  }
  
  func loginSuccess() {
    UserProfileManager.shared.userLoggedIn(iin: self.iin, pass: self.pass)
    self.delegate?.success()
  }
  
  func loginFail() {
    self.delegate?.fail()
  }
  
  
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    switch loadingState {
    case .loadingLoginPage:
      print("Loaded login page")
      loadHomePage()
    case .loadingHomePage:
      print("Loaded home page")
      checkIfLoggedIn()
    }
  }
  
  func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
    
  }
  
  // MARK:- Actions
  
  fileprivate func handleError(error: Error?) -> Bool{
    if let error = error {
      print("Error:", error)
      return false
    }
    return true
  }
  
}
