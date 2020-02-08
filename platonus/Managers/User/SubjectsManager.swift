//
//  SubjectsManager.swift
//  platonus
//
//  Created by Karina Karimova on 10/18/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import Foundation
import WebKit
import UIKit

protocol SubjectsFetcherDelegate: class {
  func gotSubjects(subjects: [Subject])
}

enum SubjectsLoadingState {
  case loadingLoginPage
  case loadingHomePage
  case loadingGradesPage
}

class SubjectsFetcher: UIViewController, WKNavigationDelegate {
  
  weak var delegate: SubjectsFetcherDelegate?
  
  fileprivate let webView = WKWebView()
  
  fileprivate var loadingState = SubjectsLoadingState.loadingLoginPage
  
  public func fetchSubjects() {
    webView.navigationDelegate = self
    
    self.loadLoginPage()
    print("Loading...")
    
  }
  
  fileprivate func loadLoginPage() {
    let platonusUrl = URL(string: "https://edu.enu.kz/")!
    let request = URLRequest(url: platonusUrl)
    loadingState = .loadingLoginPage
    webView.load(request)
  }
  
  fileprivate func loadHomePage() {
    loadingState = .loadingHomePage
    
    webView.evaluateJavaScript("change_lang_paltonus('ru')", completionHandler: nil)
    
    let iin = 950519350124
    webView.evaluateJavaScript("document.getElementById('iin_input').value='\(iin)'") { (value, error) in
      if !self.handleError(error: error) {
        return
      }
    }
    //pass_input
    let pass = "Ali620220706208"
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
  
  fileprivate func loadGradesPage() {
    loadingState = .loadingGradesPage
    
    let url = URL(string: "https://edu.enu.kz/current_progress_gradebook_student")!
    let request = URLRequest(url: url)
    webView.load(request)
  }
  
  fileprivate func getSubjects() {
    webView.evaluateJavaScript("document.getElementsByClassName('table table-bordered table-compact-2x')[0].rows.length") { (response, error) in
      if let rowsCnt = response as? Int {
        var content = [[String]](repeating: [String](), count: rowsCnt)
        for i in 0..<rowsCnt {
          self.webView.evaluateJavaScript("document.getElementsByClassName('table table-bordered table-compact-2x')[0].rows.item(\(i)).cells.length") { (response, error) in
            if let cellsCnt = response as? Int {
              for j in 0..<cellsCnt {
                self.webView.evaluateJavaScript("document.getElementsByClassName('table table-bordered table-compact-2x')[0].rows.item(\(i)).cells[\(j)].textContent") { (response, error) in
                  if let value = response as? String {
                    self.webView.evaluateJavaScript("document.getElementsByClassName('table table-bordered table-compact-2x')[0].rows.item(\(i)).cells[\(j)].style.backgroundColor") { (response, error) in
                      if let color = response as? String {
                        if value.isEmpty {
                          if color == "white" || color.isEmpty {
                            content[i].append("-")
                          } else {
                            content[i].append("*")
                          }
                        } else {
                          content[i].append(value)
                        }
                      }
                      if (i == rowsCnt - 1 && j == cellsCnt - 1) {
                        self.gotSubjects(content: content)
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  
  fileprivate func gotSubjects(content: [[String]]) {
//    print("Content:")
//    for arr in content {
//      for i in arr.indices {
//        let val = arr[i]
//
//        print(val, terminator: " ")
//      }
//      print()
//    }
    
    var subjects = [Subject]()
    var cur = [[String]]()
    var scaleItems = [String]()
    for i in 2 ..< content[0].count {
      scaleItems.append(content[0][i])
    }
    
    for i in 1 ..< content.count {
      let row = content[i]
      if containsRussianLetters(str: row[0]) {
        if !cur.isEmpty {
          let subject = Subject(scaleItems: scaleItems, content: cur)
          subjects.append(subject)
          cur = [[String]]()
        }
      }
      cur.append(row)
    }
    delegate?.gotSubjects(subjects: subjects)
  }
  
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    switch loadingState {
    case .loadingLoginPage:
      print("Loaded login page")
      loadHomePage()
    case .loadingHomePage:
      print("Loaded home page")
      loadGradesPage()
    case .loadingGradesPage:
      print("LoadedGradesPage")
      getSubjects()
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
  
  fileprivate func isRusLetter(char: Character) -> Bool {
    let lower = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя"
    let upper = "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ"
    if (lower.contains(char) || upper.contains(char)) {
      return true
    } else {
      return false
    }
  }
  
  fileprivate func containsRussianLetters(str: String) -> Bool {
    for char in str {
      if isRusLetter(char: char) {
        return true
      }
    }
    return false
  }
  
}
