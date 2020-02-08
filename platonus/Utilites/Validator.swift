//
//  Validator.swift
//  platonus
//
//  Created by Karina Karimova on 10/16/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import Foundation

let binRegex = "^\\d{12}$"

let nameRegex = "^[A-ZА-ЯЁӘІҢҒҮҰҚӨҺ][A-Za-zА-Яа-яЁёӘәІіҢңҒғҮүҰұҚқӨөҺһ'][A-Za-zА-Яа-яЁёӘәІіҢңҒғҮүҰұҚқӨөҺһ\\-.' ]*$"

class Validator {
  
  static func isValidIIN(IIN: String?) -> Bool {
    if IIN?.count != 12 {
      return false
    }
    let iinPredicate = NSPredicate.init(format: "SELF MATCHES %@", binRegex)
    if !iinPredicate.evaluate(with: IIN) {
      return false
    }
    
    return isValidControlNum(identification: IIN!)
  }
  
  static func isIIN(IIN: String?) -> Bool {
    if IIN?.count != 12 {
      return false
    }
    let iinPredicate = NSPredicate.init(format: "SELF MATCHES %@", binRegex)
    if !iinPredicate.evaluate(with: IIN) {
      return false
    }
    
    let start = IIN!.index((IIN?.startIndex)!, offsetBy: 0)
    let end = IIN!.index((IIN?.startIndex)!, offsetBy: 6)
    let dateSubstring = IIN?.substring(with: start..<end)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyMMdd"
    let birthDate = dateFormatter.date(from: dateSubstring!)
    if birthDate == nil {
      return false
    }
    
    return isValidControlNum(identification: IIN!)
  }
  
  static func isValidControlNum(identification: String) ->Bool {
    var control = 0
    for i in 0..<identification.count - 1 {
      let start = identification.index(identification.startIndex, offsetBy: i)
      let end = identification.index(after: start)
      control += Int(identification.substring(with: start..<end))! * (i + 1)
    }
    
    if control % 11 == 10 {
      control = 0
      for i in 0..<identification.count - 1 {
        let start = identification.index(identification.startIndex, offsetBy: i)
        let end = identification.index(after: start)
        if i < 9 {
          control += Int(identification.substring(with: start..<end))! * (i + 3)
        } else {
          control += Int(identification.substring(with: start..<end))! * (i - 8)
        }
      }
    }
    
    let start = identification.index(identification.startIndex, offsetBy: 11)
    let end = identification.index(after: start)
    let controlNum = Int(identification.substring(with: start..<end))!
    if controlNum != control % 11 {
      return false
    }
    
    return true
  }
  
  static func isValidName(name: String?) -> Bool {
    guard let name = name else { return false }
    let nameTest = NSPredicate(format: "SELF MATCHES %@", nameRegex)
    
    return nameTest.evaluate(with: name)
  }
  
  static func isValidPassword(password: String?) -> Bool {
    let pattern = "^[A-Za-z0-9.,:;?!'\"`^&=|~*+%\\-<>@\\[\\]{}()/\\\\_$#]{6,100}$"
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", pattern)
    let passwordTest2 = NSPredicate(format: "SELF MATCHES %@", pattern)
    let passwordTest3 = NSPredicate(format: "SELF MATCHES %@", pattern)
    return passwordTest.evaluate(with: password)
      || passwordTest2.evaluate(with: password)
      || passwordTest3.evaluate(with: password)
  }
  
}

