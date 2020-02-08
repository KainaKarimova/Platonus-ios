//
//  Constants.swift
//  platonus
//
//  Created by Karina Karimova on 10/16/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
  
  struct SignIn {
    static let enterIIN = "ИИН"
    static let password = "Пароль"
    static let signIn = "Войти"
  }
  
  struct MainMenu {
    
  }
  
  struct Misc {
    static let nothingFoundError = "Ничего не найдено"
    static let networkError = "Не удаётся установить соединение с сервером. Попробуйте заново"
    static let genericError = "Ошибка!"
    static let refresh = "Обновить"
  }
}

struct Colors {
  
  static let mainBackgroundColor = UIColor(red:0.94, green:0.95, blue:0.98, alpha:1.0)
  static let navigationTextColor = UIColor(red: 79.0/255.0, green: 87.0/255.0, blue: 99.0/255.0, alpha: 1.0)
  static let blueColor = UIColor(red: 78.0/255.0, green: 142.0/255.0, blue: 237.0/255.0, alpha: 1.0)
  static let inactiveColor = UIColor(red:0.55, green:0.63, blue:0.73, alpha:1.0)
}

struct Fonts {
  static let playRegular = UIFont(name: "Play-Regular", size: UIFont.labelFontSize)
  static let playBold = UIFont(name: "Play-Bold", size: UIFont.labelFontSize)
}
