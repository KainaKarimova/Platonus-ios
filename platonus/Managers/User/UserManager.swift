//
//  UserManager.swift
//  platonus
//
//  Created by Karina Karimova on 10/18/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import Foundation

class UserProfileManager {
  static let shared: UserProfileManager = UserProfileManager()
  
  lazy var userIIN = Preferences<String>("user_iin")
  lazy var userPass = Preferences<String>("user_pass")
  
  //  lazy var isLoggedIn = Preferences<Bool>("logged_in")
  var isLoggedIn: Bool {
    get {
      if let _ = userIIN.value,
        let _ = userPass.value {
        return true
      } else {
        return false
      }
    }
  }

  
//  func getCurrentUser() -> User? {
//    return Auth.auth().currentUser
//  }
  
  func userLoggedIn(iin: String, pass: String) {
    print("Signed in")
    userIIN.value = iin
    userPass.value = pass
  }
  
  func userLoggedOut() {
    userIIN.value = nil
    userPass.value = nil
  }
  
}
