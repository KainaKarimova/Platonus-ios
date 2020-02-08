//
//  MappableProtocol.swift
//  platonus
//
//  Created by Karina Karimova on 10/16/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import Foundation

protocol Mappable: class {
  func toDataObject() -> [String : Any?]
}
