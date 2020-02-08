//
//  PlatonusUtil.swift
//  platonus
//
//  Created by Karina Karimova on 10/16/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import Foundation

class PlatonusUtil {
  
  static func getDateSeparatorStringFor(date: Date) -> String {
    let dateFormatter = DateFormatter()
    if dateFormatter.locale.identifier == "ru_KZ" {
      dateFormatter.dateFormat = "dd MMMM"
    } else {
      dateFormatter.dateFormat = "MMMM dd"
    }
    return dateFormatter.string(from: date)
  }
  
  static func getTextWithNumbersOnly(text: String?) -> String {
    return (text?.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: ""))!
  }
  
  static func getTextWithNoSymbols(text: String?) -> String {
    let characterSet = CharacterSet(
      charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    )
    return (text?.components(separatedBy: characterSet.inverted).joined(separator: ""))!
  }
  
  static func isRusLetter(char: Character) -> Bool {
    let lower = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя"
    let upper = "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ"
    if (lower.contains(char) || upper.contains(char)) {
      return true
    } else {
      return false
    }
  }
  
  static func containsRussianLetters(str: String) -> Bool {
    for char in str {
      if isRusLetter(char: char) {
        return true
      }
    }
    return false
  }
}
